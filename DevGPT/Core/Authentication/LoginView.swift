//
//  LoginView.swift
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

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Image(systemName: "graduationcap.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 220)
                .padding(.bottom, 20)
            
            VStack(spacing: 20) {
                CustomField(
                    text: $email,
                    placeholder: Text("Email"),
                    imageName: "envelope.fill",
                    isSecure: false
                )
                
                CustomField(
                    text: $password,
                    placeholder: Text("Password"),
                    imageName: nil,
                    isSecure: true
                )
            }
            
            Button(action: {

            }, label: {
              Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 360, height: 50)
                .background(Color(.black))
                .clipShape(Capsule())
                .padding()
            })
            
            Spacer()
            
            NavigationLink(
              destination: EmptyView()) {
              HStack {
                Text("Don't have an account?")
                  .font(.system(size: 16))
                Text("Sign Up")
                  .font(.system(size: 16, weight: .semibold))
              }
              .foregroundColor(Color(.black))
            }
            .padding(.bottom, 16)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginView()
        }
    }
}
