//
//  Response.swift
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
import FirebaseFirestoreSwift
import Firebase

struct Response: Identifiable, Codable {
    @DocumentID var id: String?
    let prompt: String
    let response: String
    let language: String
    var thumbnail: String?
    var feedback: Feedback?
    var rootId: String
    let timestamp: Timestamp
    
    init(
        id: String? = nil,
        prompt: String,
        response: String,
        thumbnail: String? = nil,
        feedback: Feedback? = nil,
        language: String,
        rootId: String = ""
    ) {
        self.id = id
        self.prompt = prompt
        self.response = response
        self.thumbnail = thumbnail
        self.feedback = feedback
        self.language = language
        self.rootId = rootId
        self.timestamp = Timestamp(date: Date())
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case prompt
        case response
        case thumbnail
        case feedback
        case language
        case rootId
        case timestamp
    }
    
    func toAnyObject() -> [String: Any] {
        var result = [
            "prompt": prompt,
            "response": response,
            "language": language,
            "rootId": rootId,
            "timestamp": timestamp
        ] as [String: Any]
        
        if let thumbnail = thumbnail {
            result["thumbnail"] = thumbnail
        } else {
            result["thumbnail"] = ""
        }
        
        if let feedback = feedback {
            result["feedback"] = feedback.toAnyObject()
        }
        
        return result
    }
}
