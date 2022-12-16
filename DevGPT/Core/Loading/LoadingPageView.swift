//
//  LoadingPageView.swift
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

struct LoadingPageView: View {
    @ObservedObject var viewModel: LoadingViewModel
    
    @State private var downloadAmount = 0.0
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    init(input: String, user: User) {
        self.viewModel = LoadingViewModel(input: input, user: user)
    }
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                loadingBar
                    .padding(.top, 50)
                
                Text("Tip")
                    .font(.headline)
                    .bold()
                    .padding(.top, 180)
                    .padding(.trailing, 280)
                    .foregroundColor(Color.theme.accent)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla venenatis at velit in efficitur. Praesent nec orci convallis, vehicula ipsum quis, tempus velit. Quisque eget ex nec sapien vestibulum auctor.")
                    .frame(maxWidth: UIScreen.main.bounds.width - 160)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 4)
                    .padding(.trailing, 40)
                    .foregroundColor(Color.theme.accent)
                
                Spacer()
                
                NavigationLink(
                    destination: ResponseView(user: viewModel.user, outputResponse: viewModel.response).navigationBarBackButtonHidden(true),
                    isActive: $viewModel.isNotLoading,
                    label: { EmptyView() }
                )
            }
            .task {
                do {
                    try await self.viewModel.getResponse()
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
}

extension LoadingPageView {
    private var loadingBar: some View {
        ProgressView(value: downloadAmount, total: 100)
            .padding()
            .padding(.horizontal, 38)
            .onReceive(timer) { _ in
                if downloadAmount <= 99.9 {
                    downloadAmount += 0.09
                }
            }
            .foregroundColor(Color.theme.statusBar)
            .tint(Color.theme.accent)
    }
}

struct LoadingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPageView(input: "bleh", user: User(id: "", tokens: 15, email: "test@test.com", profileImageUrl: "https://firebasestorage.googleapis.com/v0/b/kiyomimvp.appspot.com/o/profile_image%2F82C4568D-A1F7-4F83-A892-61F913126CBB?alt=media&token=13e98590-202d-4e3f-b92a-6900e8797b0a", username: "MarcoDotIO", collections: nil, responses: nil))
    }
}
