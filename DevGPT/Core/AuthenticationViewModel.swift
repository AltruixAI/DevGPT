//
//  AuthenticationViewModel.swift
//  DevGPT
//
//  Copyright (c) 2022 MarcoDotIO
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//  

import SwiftUI
import Firebase

class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isEmailVerified: Bool?
    
    static let shared = AuthenticationViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(
        withEmail email: String,
        password: String,
        completion: @escaping(String) -> Void
    ) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(error.localizedDescription)
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(
        withEmail email: String,
        password: String,
        username: String,
        image: UIImage?,
        completion: @escaping(String)-> Void
    ) {
        let defaultImage = UIImage(named: "unfilledProfile")
        
        ImageUploader.uploadImage(image: image ?? (defaultImage!)) { imageURL in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    let logResult = "\(error.localizedDescription)"
                    completion(logResult)
                }
                
                guard let user = result?.user else { return }
                
                let data: [String: Any] = [
                    "email": email,
                    "username": username,
                    "profileImageUrl": imageURL,
                    "uid": user.uid,
                    "tokens": 15
                ]
                
                COLLECTION_USERS.document(user.uid).setData(data) { error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    self.userSession = user
                    self.fetchUser()
                }
            }
        }
    }
    
    func registerPartOne(
        withEmail email: String,
        password: String,
        username: String,
        completion: @escaping(String)-> Void)
    {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                let logResult = "\(error.localizedDescription)"
                completion(logResult)
            }
            
            guard let user = result?.user else { return }
            
            self.userSession = user
            
            Auth.auth().currentUser?.sendEmailVerification() { error in
                if let error = error {
                    let logResult = "\(error.localizedDescription)"
                    completion(logResult)
                }
            }
        }
    }
    
    func registerPartTwoWithoutImage(
        username: String,
        email: String,
        completion: @escaping(String)-> Void) {
            if let uid = self.userSession?.uid {
                let data: [String: Any] = [
                    "email": email,
                    "username": username,
                    "uid": uid,
                    "tokens": 15
                ]
                
                COLLECTION_USERS.document(uid).setData(data) { error in
                    if let error = error {
                        print(error.localizedDescription)
                        completion(error.localizedDescription)
                    }
                    
                    self.fetchUser()
                }
            }
        }
    
    func registerPartTwo(
        profileImage: UIImage,
        username: String,
        email: String,
        completion: @escaping(String)-> Void
    ) {
        ImageUploader.uploadImage(image: profileImage, type: .profile) { profileImageURL in
            if let uid = self.userSession?.uid {
                let data: [String: Any] = [
                    "email": email,
                    "username": username,
                    "profileImageUrl": profileImageURL,
                    "uid": uid,
                    "tokens": 15
                ]
                
                COLLECTION_USERS.document(uid).setData(data) { error in
                    if let error = error {
                        print(error.localizedDescription)
                        completion(error.localizedDescription)
                    }
                    
                    self.fetchUser()
                }
            }
        }
    }
    
    func isVerified() {
        let user = Auth.auth().currentUser
        if let user = user {
            user.reload() { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self.isEmailVerified = user.isEmailVerified
                }
            }
        } else {
            self.isEmailVerified = false
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword(withEmail email: String, completion: @escaping(String) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                completion(error.localizedDescription)
            } else {
                completion("Successfully sent reset link. Please check your email")
            }
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let snapshot = snapshot else { return }
            guard var user = try? snapshot.data(as: User.self) else { return }
            
            COLLECTION_USERS.document(uid).collection("collections").getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let collections = documents.compactMap { try? $0.data(as: Collection.self) }
                user.collections = collections
                
                COLLECTION_USERS.document(uid).collection("responses").getDocuments { snapshot, _ in
                    guard let documents = snapshot?.documents else { return }
                    let responses = documents.compactMap { try? $0.data(as: Response.self) }
                    print("\(responses.count)")
                    user.responses = responses
                    self.currentUser = user
                }
            }
        }
    }
}
