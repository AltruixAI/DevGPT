//
//  ResponseGridView.swift
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

struct ResponseGridView: View {
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 35),
        GridItem(.flexible(), spacing: 30)
    ]
    
    private let spacing: CGFloat = 20
    
    @Environment(\.presentationMode) var presentationMode
    
    let responses: [Response]?
    
    @State private var isTransitioning: Bool = false
    @State private var selectedResponse: Response? = nil
    
    let user: User
    
    var body: some View {
        if let responses = responses {
            ZStack {
                NavigationLink(destination: ResponseRelayView(user: user, outputResponse: selectedResponse).navigationBarBackButtonHidden(true), isActive: $isTransitioning, label: { EmptyView() })
                
                Color.theme.statusBar.ignoresSafeArea()
                
                Color.theme.background.ignoresSafeArea(edges: [.bottom])
                    .padding(.top, 5)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "arrow.left")
                                    .font(.system(size: 26))
                                    .bold()
                                    .foregroundColor(Color.theme.accent)
                                    .padding(.bottom)
                                    .padding(.leading)
                            }
                            
                        }
                        
                        LazyVGrid(
                            columns: columns,
                            alignment: .leading,
                            spacing: spacing,
                            pinnedViews: []) {
                                ForEach(responses) { response in
                                    HStack {
                                        Button {
                                            selectedResponse = response
                                            isTransitioning.toggle()
                                        } label: {
                                            ResponseThumbnailView(response: response)
                                        }

                                    }
                                }
                            }
                            .padding(.trailing, 23)
                            .padding(.leading, 22)
                    }
                }
                .padding(.top, 20)
            }
            .onAppear {
                self.isTransitioning = false
            }
        }
    }
}

struct ResponseGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ResponseGridView(responses: [dev.response1, dev.response2], user: dev.user)
        }
    }
}
