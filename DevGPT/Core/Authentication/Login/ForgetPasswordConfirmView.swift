//
//  ForgetPasswordConfirmView.swift
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

struct ForgetPasswordConfirmView: View {
    @State private var isCancelled: Bool = false
    
    let email: String
    
    var body: some View {
        ZStack {
            Color.theme.statusBar.ignoresSafeArea()
            
            Color.theme.background.ignoresSafeArea(edges: [.bottom])
                .padding(.top, 5)
            
            NavigationLink(
                destination: EnterEmailView().navigationBarBackButtonHidden(true),
                isActive: $isCancelled,
                label: { EmptyView() }
            )
            
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
                        Image(systemName: "arrow.left")
                            .font(.system(size: 24))
                            .padding(.leading, 24)
                            .tint(Color.theme.accent)
                    }
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("Reset your password")
                            .font(Font.custom("Poppins", size: 34))
                            .foregroundColor(Color.theme.accent)
                            .padding(.top, 34)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("We sent an email to \(email)\nClick the link in the email to reset your password.")
                            .font(Font.custom("Poppins", size: 16))
                            .foregroundColor(Color.theme.accent.opacity(0.75))
                            .padding(.leading, 28)
                            .padding(.top, -24)
                        
                        Spacer()
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct ForgetPasswordConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ForgetPasswordConfirmView(email: "test@test.com")
        }
    }
}
