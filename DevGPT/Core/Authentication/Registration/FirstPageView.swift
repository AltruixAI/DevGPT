//
//  FirstPageView.swift
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

struct FirstPageView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
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
                        Text("Cancel")
                            .font(.system(size: 20))
                            .padding(.top, 24)
                            .padding(.leading, 24)
                            .tint(Color.theme.accent)
                    }
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("Create your account")
                            .font(.system(size: 38))
                            .foregroundColor(Color.theme.accent)
                            .padding(.top, 34)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    
                    CustomField(
                        text: $username,
                        placeholder: "Username",
                        imageName: "person.fill",
                        isSecure: false
                    )
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    
                    CustomField(
                        text: $email,
                        placeholder: "Email",
                        imageName: "person.fill",
                        isSecure: false
                    )
                    .padding(.top, 15)
                    .padding(.horizontal, 30)
                    
                    CustomField(
                        text: $password,
                        placeholder: "Password",
                        imageName: "person.fill",
                        isSecure: true
                    )
                    .padding(.top, 15)
                    .padding(.horizontal, 30)
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        
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
        }
    }
}

struct FirstPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FirstPageView()
        }
    }
}
