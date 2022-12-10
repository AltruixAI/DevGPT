//
//  GPT3Services.swift
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
import Firebase

class GPT3Services {
    static let shared = GPT3Services()
    
    private init() { }
    
    func getAPIKey() async -> String {
        let collectionName = "Secrets"
        let documentName = "OpenAIKey"
        
        let secretsCollection = Firestore.firestore().collection(collectionName)
        
        return await withCheckedContinuation({ con in
            secretsCollection.document(documentName).getDocument { snapshot, error in
                if let documents = snapshot {
                    if let secret = try? documents.data(as: Secrets.self) {
                        con.resume(returning: secret.Key)
                    } else {
                        con.resume(returning: "ERROR with decoding Secrets")
                    }
                } else {
                    con.resume(returning: "ERROR with unwrapping snapshot")
                }
            }
        })
    }
}

struct Secrets: Codable {
    let Key: String
}
