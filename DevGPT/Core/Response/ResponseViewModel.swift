//
//  ResponseViewModel.swift
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
import SwiftUI

class ResponseViewModel: ObservableObject {
    let user: User
    var response: Response?
    
    init(user: User, response: Response?) {
        self.user = user
        self.response = response
    }
    
    func saveResponse() {
        guard let uid = self.user.id else { return }
        
        if var response = response {
            let imageView: UIImage = ChatResponseView(output: response.response).asUiImage()
            
            ImageUploader.uploadImage(image: imageView, type: .thumbnail) { imageURL in
                response.thumbnail = imageURL
                
                let data = [
                    "prompt": response.prompt,
                    "response": response.response,
                    "thumbnail": imageURL,
                    "language": response.language,
                    "rootId": response.rootId,
                    "timestamp": response.timestamp
                ] as [String: Any]
                
                COLLECTION_USERS
                    .document(uid)
                    .collection("responses")
                    .document(response.rootId)
                    .setData(data)
            }
        }
    }
}
