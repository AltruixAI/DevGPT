//
//  SecondPageView.swift
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

struct SecondPageView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var isVerified: Bool = false
    @State private var isCancelled: Bool = false
    @State private var isChangingInfo: Bool = false
    @State private var isTransitioned: Bool = false
    
    @Binding var email: String
    @Binding var username: String
    
    let timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.theme.statusBar.ignoresSafeArea()
            
            Color.theme.background.ignoresSafeArea(edges: [.bottom])
                .padding(.top, 5)
            
            NavigationLink(
                destination: FirstPageView().navigationBarBackButtonHidden(true),
                isActive: $isChangingInfo,
                label: { EmptyView() }
            )
            
             NavigationLink(
                destination: ThirdPageView(username: $username, email: $email).navigationBarBackButtonHidden(true),
                isActive: $isTransitioned,
                label: { EmptyView() }
             )
            
            if !isVerified {
                VStack {
                    // Logo
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 250, height: 50)
                        .padding(.top, 23)
                    
                    HStack {
                        Button {
                            timer.upstream.connect().cancel()
                            isChangingInfo.toggle()
                        } label: {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 24))
                                .padding(.leading, 24)
                                .tint(Color.theme.accent)
                        }
                        
                        Spacer()
                    }
                    
                    VStack {
                        HStack {
                            Text("Verify your email")
                                .font(Font.custom("Poppins", size: 34))
                                .foregroundColor(Color.theme.accent)
                                .padding(.top, 34)
                                .padding(.leading, 24)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("We sent an email to \(email)\nClick the link in the email to verify.")
                                .font(Font.custom("Poppins", size: 16))
                                .foregroundColor(Color.theme.accent.opacity(0.75))
                                .padding(.leading, 28)
                                .padding(.top, -24)
                            
                            Spacer()
                        }
                    }
                    
                    Spacer()
                }
                .onReceive(timer) { _ in
                    authenticationViewModel.isVerified()

                    if let verified = authenticationViewModel.isEmailVerified, verified {
                        self.isVerified = true
                    }
                }
            } else {
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 250)
                        .padding(.vertical, 20)
                        .offset(y: 15)
                    
                    Spacer()
                    
                    ZStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .font(.system(size: 80))
                            .foregroundColor(Color.theme.accent)
                            .padding(.bottom, 180)
                        
                        Text("All set!")
                            .font(Font.custom("Poppins", size: 30))
                            .foregroundColor(Color.theme.accent)
                            .padding(.bottom, 34)
                    }
                    
                    Spacer()
                }
                .onAppear {
                    let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                        self.timer.upstream.connect().cancel()
                        isTransitioned.toggle()
                    }
                }
            }
        }
    }
}

struct SecondPageView_Previews: PreviewProvider {
    struct previewHandler: View {
        @State private var email: String = "test@test.com"
        @State private var username: String = "MarcoDotIO"
        
        var body: some View {
            SecondPageView(email: $email, username: $username)
        }
    }
    
    static var previews: some View {
        NavigationStack {
            previewHandler()
        }
    }
}
