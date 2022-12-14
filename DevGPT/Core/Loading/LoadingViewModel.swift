//
//  LoadingViewModel.swift
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
import OpenAIKit

@MainActor class LoadingViewModel: ObservableObject {
    @Published var response: Response?
    @Published var isNotLoading: Bool = false
    
    let input: String
    let user: User
    
    init(input: String, user: User) {
        self.input = input
        self.user = user
    }
    
    func getResponse() async throws {
        let apiKey = await GPT3Services.shared.getAPIKey()
        
        if apiKey.contains("ERROR") {
            print("Error with the API Key")
            return
        }
        
        let openAI = OpenAI(Configuration(organization: "MarcoDotIO", apiKey: apiKey))
        let completionParameters = CompletionParameters(
            model: "text-davinci-003",
            prompt: [input],
            maxTokens: 1000,
            temperature: 0.01,
            user: user.id
        )
        let completionResponse = try await openAI.generateCompletion(parameters: completionParameters)
        let outputText = completionResponse.choices[0].text
        
        let programmingLanguages = getProgrammingLanguages(from: input)
        
        self.response = Response(prompt: input, response: outputText, language: programmingLanguages[0])
        
        self.isNotLoading = true
    }
    
    func getProgrammingLanguages(from string: String) -> [String] {
        let regexString =
            "/\\b(Java|C\\+\\+|Python|Ruby|Go|JavaScript|TypeScript|PHP|C#|C|Rust|Shell|Kotlin|Haskell|R|Elixir|Elm|Erlang|F#|Julia|Objective-C|Perl|Swift|Elixir)\\b/gi"
        let regex = try! NSRegularExpression(pattern: regexString)
        let matches = regex.matches(in: string, range: NSRange(string.startIndex..., in: string))
        return matches.map {
            String(string[Range($0.range, in: string)!])
        }
    }
}
