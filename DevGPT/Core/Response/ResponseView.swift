//
//  ResponseView.swift
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

struct ResponseView: View {
    @State private var showSaveResponse: Bool = false
    @State private var text: String = ""
    
    let userId: String
    let outputResponse: Response?
    
    var body: some View {
        if let outputResponse = outputResponse {
            ZStack {
                VStack {
                    ScrollView {
                        InputResultView(input: outputResponse.prompt)
                        
                        ChatResponseView(output: outputResponse.response)

                        responseBar
                            .padding(.top)
                    }
                    .padding(.bottom, 90)
                }
                
                SearchBarView(searchText: $text, userId: userId)
                    .offset(y: 390)
            }
            .sheet(isPresented: $showSaveResponse, content: {
                if let outputResponse = outputResponse {
                    AddToCollectionView(response: outputResponse, userId: userId)
                }
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Text("Back")
                            .padding(.bottom)
                    }
                }
            }
        }
    }
}

extension ResponseView {
    private var responseBar: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "square.and.arrow.up.fill")
                    .foregroundColor(.black)
            }
            .padding(.leading, 48)
            
            Button {
                
            } label: {
                Image(systemName: "doc.on.doc.fill")
                    .foregroundColor(.black)
            }
            .padding(.leading, 16)
            
            Button {
                showSaveResponse = true
            } label: {
                Image(systemName: "plus.square")
                    .foregroundColor(.black)
            }
            .padding(.leading, 16)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.black)
            }
            .padding(.trailing, 16)
            
            Button {
                
            } label: {
                Image(systemName: "hand.thumbsdown.fill")
                    .foregroundColor(.black)
            }
            .padding(.trailing, 48)
        }
    }
}

struct ResponseView_Previews: PreviewProvider {
    struct helperResponse: View {
        let response = Response(prompt: "Say this is a test", response: "Lorem ipsum dolor sit amet")
        
        var body: some View {
            ResponseView(userId: "Test", outputResponse: response)
        }
    }
    
    static var previews: some View {
        NavigationStack {
            helperResponse()
        }
    }
}
