//
//  EnterPasswordView.swift
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

struct EnterPasswordView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var password: String = ""
    @State private var isContiuing: Bool = false
    @State private var isCancelled: Bool = false
    @State private var error: String? = nil
    @State private var isShowingPassword: Bool = false
    @State private var isResettingPassword: Bool = false
    
    let email: String
    
    var body: some View {
        ZStack {
            Color.theme.statusBar.ignoresSafeArea()
            
            Color.theme.background.ignoresSafeArea(edges: [.bottom])
                .padding(.top, 5)
            
            NavigationLink(destination: OnboardingRegistrationView(), isActive: $isCancelled, label: { EmptyView() })
            
            NavigationLink(destination: ForgetPasswordView().navigationBarBackButtonHidden(true), isActive: $isResettingPassword, label: { EmptyView() })
            
            VStack {
                // Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width - 250, height: 50)
                    .padding(.top, 23)
                
                HStack {
                    Button {
                        isCancelled.toggle()
                    } label: {
                        Text("Cancel")
                            .font(.system(size: 20))
                            .padding(.top, 20)
                            .padding(.leading, 26)
                            .tint(Color.theme.accent)
                    }
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("Enter your password")
                            .font(Font.custom("Poppins", size: 30))
                            .foregroundColor(Color.theme.accent)
                            .padding(.top, 16)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    
                    ZStack {
                        CustomField(
                            text: $password,
                            placeholder: "Password",
                            imageName: "person.fill",
                            isSecure: !isShowingPassword
                        )
                        .padding(.top, 16)
                        .padding(.horizontal, 26)
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                isShowingPassword.toggle()
                            } label: {
                                Image(systemName: isShowingPassword ? "eye" : "eye.slash")
                                    .tint(Color.theme.accent.opacity(0.5))
                            }
                        }
                        .padding(.trailing, 30)
                        .padding(.bottom, 6)
                    }
                    
                    if let error = error {
                        HStack {
                            Text(error)
                                .padding(.horizontal, 30)
                                .foregroundColor(Color.theme.error)
                            
                            Spacer()
                        }
                    }
                }
                
                Spacer()
                
                VStack {
                    Button(action: {
                        self.error = nil
                        authenticationViewModel.login(
                            withEmail: email,
                            password: password
                        ) { error in
                            self.error = error
                        }
                    }) {
                        Text("Log In")
                            .font(.headline)
                            .foregroundColor(Color.theme.background)
                            .frame(width: 270, height: 50)
                            .background(Color.theme.accent)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    Button(action: {
                        self.error = nil
                        isResettingPassword.toggle()
                    }) {
                        Text("Forgot password?")
                            .font(.headline)
                            .foregroundColor(Color.theme.accent)
                            .frame(width: 270, height: 50)
                            .background(
                                ZStack {
                                    Capsule()
                                        .foregroundColor(Color.theme.accent)
                                    
                                    Capsule()
                                        .foregroundColor(Color.theme.background)
                                        .frame(width: 265, height: 45)
                                }
                            )
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

struct EnterPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EnterPasswordView(email: "test@test.com")
        }
    }
}
