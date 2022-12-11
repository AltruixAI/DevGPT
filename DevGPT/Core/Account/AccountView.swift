//
//  AccountView.swift
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
import Kingfisher

struct AccountView: View {
    @ObservedObject var viewModel: AccountViewModel
    
    @State private var showAddTokens: Bool = false
    
    init(user: User) {
        self.viewModel = AccountViewModel(user: user)
    }
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    VStack {
                        KFImage(URL(string: viewModel.user.profileImageUrl))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .padding(.top, 110)
                        
                        Text(viewModel.user.username)
                            .font(.title)
                            .bold()
                            .padding(.top, 24)
                            .foregroundColor(Color.theme.accent)
                        
                        Text(viewModel.user.email)
                            .padding(.top, -8)
                            .foregroundColor(Color.theme.accent)
                    }
                    .padding(.trailing, 20)
                    
                    HStack {
                        Text("\(viewModel.user.tokens)")
                            .font(.system(size: 60))
                            .bold()
                            .foregroundColor(Color.theme.accent)
                        
                        Image("token")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .padding(.top, 68)
                }
                
                Spacer()
                
                AppPrimaryButton("Add Tokens +") {
                    showAddTokens.toggle()
                }
                
                Spacer()
            }
            .sheet(isPresented: $showAddTokens) {
                NavigationStack {
                    AddTokensView(tokens: $viewModel.user.tokens)
                }
            }
        }
    }
}

//struct AccountView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            AccountView()
//        }
//    }
//}
