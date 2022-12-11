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

struct Response: Identifiable, Codable {
    @DocumentID var id: String?
    let prompt: String
    let response: String
    var thumbnail: String?
    var feedback: Feedback?
    
    init(
        id: String? = nil,
        prompt: String,
        response: String,
        thumbnail: String? = nil,
        feedback: Feedback? = nil
    ) {
        self.id = id
        self.prompt = prompt
        self.response = response
        self.thumbnail = thumbnail
        self.feedback = feedback
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case prompt
        case response
        case thumbnail
        case feedback
    }
    
    func toAnyObject() -> Any {
        var result = [
            "prompt": prompt,
            "response": response
        ] as [String: Any]
        
        if let thumbnail = thumbnail {
            result["thumbnail"] = thumbnail
        }
        
        if let feedback = feedback {
            result["feedback"] = feedback.toAnyObject()
        }
        
        return result
    }
}
