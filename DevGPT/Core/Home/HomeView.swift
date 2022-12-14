//
//  HomeView.swift
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

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    init(user: User) {
        self.viewModel = HomeViewModel(user: user)
    }
    
    @State private var text: String = ""
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.theme.statusBar.ignoresSafeArea()
            
            Color.theme.background.ignoresSafeArea(edges: [.bottom])
                .padding(.top, 5)
            
            ZStack {
                VStack {
                    // Recent Responses
                    RecentResponsesView(responses: self.viewModel.user.responses)
                        .padding(.top, 50)
                    
                    FavoriteCollectionsView(collections: viewModel.user.collections)
                        .padding(.top, 20)
                    
                    Spacer()
                }
                
                VStack {
                    SearchBarView(searchText: $text, user: viewModel.user)
                        .offset(y: 330)
                }
                .padding(.bottom, keyboardHeight - 40)
                .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
            }
        }
    }
}

extension Publishers {
    // 1.
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        // 2.
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        // 3.
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User(id: "", tokens: 15, email: "test@test.com", profileImageUrl: "https://firebasestorage.googleapis.com/v0/b/kiyomimvp.appspot.com/o/profile_image%2F82C4568D-A1F7-4F83-A892-61F913126CBB?alt=media&token=13e98590-202d-4e3f-b92a-6900e8797b0a", username: "MarcoDotIO", collections: nil, responses: [Response(id: "1v", prompt: "This is a test", response: "This is a test", language: "Swift"), Response(id: "2q", prompt: "This is a test", response: "This is a test", language: "Swift"), Response(id: "3s", prompt: "This is a test", response: "This is a test", language: "Swift"), Response(id: "4rq", prompt: "This is a test", response: "This is a test", language: "Swift")]))
    }
}
