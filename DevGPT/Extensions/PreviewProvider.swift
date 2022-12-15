//
//  PreviewProvider.swift
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

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    private init() {  }
    
    let authViewModel = AuthenticationViewModel.shared
    
    let response1 = Response(id: "123b", prompt: "What is 2+2 in Python?", response: "result = 2 + 2", thumbnail: nil, feedback: nil, language: "Python")
    let response2 = Response(id: "456a", prompt: "What is 4+4 in Swift?", response: "let result = 4 + 4", thumbnail: nil, feedback: nil, language: "Swift")
    
    let collection = Collection(
        id: "789c",
        name: "Arithmatics",
        responses: [Response(id: "123b", prompt: "What is 2+2 in Python?", response: "result = 2 + 2", thumbnail: nil, feedback: nil, language: "Python"), Response(id: "456a", prompt: "What is 4+4 in Swift?", response: "let result = 4 + 4", thumbnail: nil, feedback: nil, language: "Swift")],
        favorited: true
    )
    
    let user = User(
        id: "1459op",
        tokens: 15,
        email: "test@test.com",
        profileImageUrl: "https://yt3.ggpht.com/ygrMbZl0OZSesSJY6cJfcRoQAwKU7WcodAvS1HAHhhQftBLKG9x5su5uFXXlhaLaUqCbywspZyg=s48-c-k-c0x00ffffff-no-rj",
        username: "TestAccount",
        collections: [Collection(id: "789c", name: "Arithmatics", responses: [Response(id: "123b", prompt: "What is 2+2 in Python?", response: "result = 2 + 2", thumbnail: nil, feedback: nil, language: "Python"), Response(id: "456a", prompt: "What is 4+4 in Swift?", response: "let result = 4 + 4", thumbnail: nil, feedback: nil, language: "Swift")], favorited: true)],
        responses: [Response(id: "123b", prompt: "What is 2+2 in Python?", response: "result = 2 + 2", thumbnail: nil, feedback: nil, language: "Python"), Response(id: "456a", prompt: "What is 4+4 in Swift?", response: "let result = 4 + 4", thumbnail: nil, feedback: nil, language: "Swift")]
    )
}
