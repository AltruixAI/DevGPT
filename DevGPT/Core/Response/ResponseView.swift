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
    @ObservedObject var viewModel: ResponseViewModel
    
    @State private var showSaveResponse: Bool = false
    @State private var text: String = ""
    
    let user: User
    let outputResponse: Response?
    
    init(user: User, outputResponse: Response?) {
        self.user = user
        self.outputResponse = outputResponse
        
        self.viewModel = ResponseViewModel(user: user, response: outputResponse)
    }
    
    var body: some View {
        if let outputResponse = outputResponse {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        InputResultView(input: outputResponse.prompt, imageURL: user.profileImageUrl ?? "")
                            .padding(.top)
                        
                        ChatResponseView(output: outputResponse.response)
                            .padding(.top, 8)
                        
                        responseBar
                            .padding(.top)
                            .background(Color.theme.statusBar.padding(-20))
                    }
                }
                
                SearchBarView(searchText: $text, user: user)
                    .offset(y: 380)
            }
//            .onAppear {
//                self.viewModel.saveResponse()
//            }
            .sheet(isPresented: $showSaveResponse, content: {
                if let outputResponse = outputResponse {
                    AddToCollectionView(response: outputResponse, userId: user.id ?? "")
                }
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: TabBar(user: user).navigationBarBackButtonHidden(true)) {
                        Image(systemName: "arrow.left")
                            .padding(.bottom)
                    }
                    .tint(Color.theme.accent)
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
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.leading, 48)
            
            Button {
                
            } label: {
                Image(systemName: "doc.on.doc.fill")
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.leading, 16)
            
            Button {
                showSaveResponse = true
            } label: {
                Image(systemName: "plus.square")
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.leading, 16)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.trailing, 16)
            
            Button {
                
            } label: {
                Image(systemName: "hand.thumbsdown.fill")
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.trailing, 48)
        }
    }
}

struct ResponseView_Previews: PreviewProvider {
    struct helperResponse: View {
        let response = Response(prompt: "Say this is a test", response: "Lorem ipsum dolor sit amet dfdsdfsffsfsdffdsfdfddfasdfdfdswdffrsdfsddsffffdsdfsdfdsfsdfdsffdfsfdssdfsfdsfsdfdsfsdsdfdsfsdadssddsadasxcsdasdsdsdsdasdsdsadsadsadsdsadsdadsadsadssdaddsa", language: "Swift")

        var body: some View {
            ResponseView(user: User(id: "", tokens: 15, email: "test@test.com", profileImageUrl: "https://firebasestorage.googleapis.com/v0/b/kiyomimvp.appspot.com/o/profile_image%2F82C4568D-A1F7-4F83-A892-61F913126CBB?alt=media&token=13e98590-202d-4e3f-b92a-6900e8797b0a", username: "MarcoDotIO", collections: nil, responses: nil), outputResponse: response)
        }
    }

    static var previews: some View {
        NavigationStack {
            helperResponse()
        }
    }
}
