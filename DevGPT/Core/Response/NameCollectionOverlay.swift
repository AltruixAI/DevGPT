//
//  NameCollectionOverlay.swift
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

struct NameCollectionOverlay: View {
    @ObservedObject var viewModel = NameCollectionViewModel()
    
    @State private var feedbackText: String = ""
    
    @Binding var isShowing: Bool
    
    let response: Response
    let userId: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .opacity(0.25)
            
            VStack(alignment: .center) {
                Text("Create New Collection With Name")
                    .font(.headline)
                    .bold()
                
                TextField("Enter Name...", text: $feedbackText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .padding(.top, 4)
                
                AppPrimaryButton("Save") {
                    self.viewModel.saveNewCollection(
                        response: response,
                        name: feedbackText,
                        userId: userId
                    )
                    isShowing = false
                }
            }
            .background(
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.vertical, -16)
            )
            .frame(width: UIScreen.main.bounds.width - 80)
        }
    }
}

struct NameCollectionOverlay_Previews: PreviewProvider {
    struct NameHandler: View {
        @State private var isShowing: Bool = true
        let response = Response(prompt: "Hello", response: "World")
        
        var body: some View {
            NameCollectionOverlay(isShowing: $isShowing, response: response, userId: "Test")
        }
    }
    
    static var previews: some View {
        NameHandler()
    }
}
