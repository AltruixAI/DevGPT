//
//  AddToCollectionViewModel.swift
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

import Foundation
import SwiftUI
import Firebase

class AddToCollectionViewModel: ObservableObject {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @Published var collections: [Collection] = []
    
    let userId: String
    
    init(userId: String) {
        self.userId = userId
        self.getCollections()
    }
    
    func getCollections() {
        COLLECTION_USERS.document(userId).collection("collections").getDocuments { snapshot, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            let results = documents.compactMap { try? $0.data(as: Collection.self) }
            
            self.collections = results
        }
    }
}
