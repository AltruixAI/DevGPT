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
        VStack {
            loadingBar
                .padding(.top, 50)
            
            Text("Tip")
                .font(.headline)
                .bold()
                .padding(.top, 180)
                .padding(.trailing, 280)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla venenatis at velit in efficitur. Praesent nec orci convallis, vehicula ipsum quis, tempus velit. Quisque eget ex nec sapien vestibulum auctor.")
                .frame(maxWidth: UIScreen.main.bounds.width - 160)
                .multilineTextAlignment(.leading)
                .padding(.top, 4)
                .padding(.trailing, 40)
            
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

extension LoadingPageView {
    private var loadingBar: some View {
        ProgressView(value: downloadAmount, total: 150)
            .padding()
            .padding(.horizontal, 38)
            .onReceive(timer) { _ in
                if downloadAmount < 149 {
                    downloadAmount += 0.1
                }
            }
    }
}

//struct LoadingPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingPageView()
//    }
//}
