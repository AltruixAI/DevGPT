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

struct SecondPageView: View {
    @State private var verify: String = ""
    @State private var isVerified: Bool = false
    
    @Binding var email: String
    @Binding var password: String
    @Binding var username: String
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            if !isVerified {
                VStack {
                    // Logo
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 250)
                        .padding(.vertical, 20)
                        .offset(y: 15)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 24))
                                .padding(.top, 24)
                                .padding(.leading, 24)
                                .tint(Color.theme.accent)
                        }
                        
                        Spacer()
                    }
                    
                    VStack {
                        HStack {
                            Text("Verify your email")
                                .font(.system(size: 38))
                                .foregroundColor(Color.theme.accent)
                                .padding(.top, 34)
                                .padding(.leading, 24)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("We sent a code to \(email)\nEnter it below to verify.")
                                .font(.system(size: 16))
                                .foregroundColor(Color.theme.accent)
                                .padding(.leading, 28)
                                .padding(.top, -12)
                            
                            Spacer()
                        }
                        
                        CustomField(
                            text: $verify,
                            placeholder: "Verification Code",
                            imageName: "person.fill",
                            isSecure: false
                        )
                        .padding(.top, 30)
                        .padding(.horizontal, 30)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.linear) {
                                isVerified.toggle()
                            }
                        }) {
                            Text("Next")
                                .font(.headline)
                                .foregroundColor(Color.theme.background)
                                .frame(width: 150, height: 50)
                                .background(Color.theme.accent)
                                .cornerRadius(8)
                                .padding(.trailing, 24)
                        }
                    }
                }
                .transition(.move(edge: .leading))
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
                            .font(.system(size: 30))
                            .foregroundColor(Color.theme.accent)
                            .padding(.bottom, 34)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct SecondPageView_Previews: PreviewProvider {
    struct previewHandler: View {
        @State private var email: String = "test@test.com"
        @State private var username: String = ""
        @State private var password: String = ""
        
        var body: some View {
            SecondPageView(email: $email, password: $password, username: $username)
        }
    }
    
    static var previews: some View {
        previewHandler()
    }
}
