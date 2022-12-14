//
//  SearchBarView.swift
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

struct SearchBarView: View {
    @State private var isLoading: Bool = false
    
    @Binding var searchText: String
    
    let user: User
    
    var body: some View {
        HStack {
            TextField("", text: $searchText)
                .placeholder(when: searchText.isEmpty) {
                    Text("Type Your Code Question...")
                        .foreground(
                            LinearGradient(
                                gradient: .init(colors: [Color.theme.accent, Color.theme.highlight]),
                                startPoint: .topLeading,
                                endPoint: .bottomLeading
                            )
                        )
                }
                .foregroundColor(Color.theme.accent)
                .autocorrectionDisabled()
                .overlay (
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(
                            searchText.isEmpty ?
                            0.0 :
                            1.0
                        )
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            self.searchText = ""
                        }
                    , alignment: .trailing)
            
            Button {
                isLoading.toggle()
            } label: {
                Image("airplane")
            }
            
            NavigationLink(
                destination: LoadingPageView(input: searchText, user: user)
                    .navigationBarBackButtonHidden(true),
                isActive: $isLoading,
                label: { EmptyView() }
            )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.textField)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    struct previewHandler: View {
        @State private var text: String = ""
        let user: User
        
        var body: some View {
            SearchBarView(searchText: $text, user: user)
        }
    }
    
    static var previews: some View {
        previewHandler(user: dev.user)
    }
}
