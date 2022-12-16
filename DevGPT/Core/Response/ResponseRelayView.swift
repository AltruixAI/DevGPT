//
//  ResponseRelayView.swift
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
import Combine
import UniformTypeIdentifiers

struct ResponseRelayView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel: ResponseViewModel
    
    @State private var showSaveResponse: Bool = false
    @State private var text: String = ""
    @State private var keyboardHeight: CGFloat = 0
    @State private var showPositiveFeedback: Bool = false
    @State private var showNegativeFeedback: Bool = false
    
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
                Color.theme.statusBar.ignoresSafeArea()
                
                Color.theme.background.ignoresSafeArea(edges: [.bottom])
                    .padding(.top, 5)
                
                VStack {
                    ScrollView {
                        InputResultView(input: outputResponse.prompt, imageURL: user.profileImageUrl ?? "")
                            .padding(.top, 10)
                        
                        ChatResponseView(output: outputResponse.response.trimmingCharacters(in: .whitespacesAndNewlines))
                        
                        responseBar
                            .padding(.top)
                            .background(Color.theme.statusBar.padding(-20))
                        
                        SearchBarView(searchText: $text, user: user)
                            .padding(.top, 40)
                    }
                }
            }
            .sheet(isPresented: $showSaveResponse, content: {
                if let outputResponse = outputResponse, let id = user.id {
                    AddToCollectionView(response: outputResponse, userId: id)
                }
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { self.presentationMode.wrappedValue.dismiss() } label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 26))
                            .bold()
                            .foregroundColor(Color.theme.accent)
                            .padding(.bottom, 40)
                    }
                    .tint(Color.theme.accent)
                }
            }
            .overlay(
                showPositiveFeedback ?
                PositiveFeedbackView(response: outputResponse, isShowingPrompt: $showPositiveFeedback, user: user) :
                nil
            )
            .overlay(
                showNegativeFeedback ?
                NegativeFeedbackView(isShowingPrompt: $showNegativeFeedback, response: outputResponse) :
                nil
            )
        }
    }
}

extension ResponseRelayView {
    private var responseBar: some View {
        HStack {
            Button {
                let activityVC = UIActivityViewController(activityItems: [outputResponse?.response ?? ""], applicationActivities: nil)
                UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
            } label: {
                Image(systemName: "square.and.arrow.up.fill")
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.leading, 48)
            
            Button {
                UIPasteboard.general.setValue(outputResponse?.response ?? "", forPasteboardType: UTType.plainText.identifier)
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
                showPositiveFeedback.toggle()
            } label: {
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.trailing, 16)
            
            Button {
                showNegativeFeedback.toggle()
            } label: {
                Image(systemName: "hand.thumbsdown.fill")
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.trailing, 48)
        }
    }
}

struct ResponseRelayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ResponseRelayView(user: dev.user, outputResponse: dev.response1)
        }
    }
}
