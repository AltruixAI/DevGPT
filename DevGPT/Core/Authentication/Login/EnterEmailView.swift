//
//  EnterEmailView.swift
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

struct EnterEmailView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var email: String = ""
    @State private var isContiuing: Bool = false
    @State private var isCancelled: Bool = false
    @State private var error: String? = nil
    
    var body: some View {
        ZStack {
            Color.theme.statusBar.ignoresSafeArea()
            
            Color.theme.background.ignoresSafeArea(edges: [.bottom])
                .padding(.top, 5)
            
            NavigationLink(destination: OnboardingRegistrationView(), isActive: $isCancelled, label: { EmptyView() })
            
            NavigationLink(destination: EnterPasswordView(email: email).navigationBarBackButtonHidden(true), isActive: $isContiuing, label: { EmptyView() })
            
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
                        Text("Enter your email")
                            .font(Font.custom("Poppins", size: 30))
                            .foregroundColor(Color.theme.accent)
                            .padding(.top, 16)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    
                    CustomField(
                        text: $email,
                        placeholder: "Email",
                        imageName: "person.fill",
                        isSecure: false
                    )
                    .padding(.top, 15)
                    .padding(.horizontal, 26)
                    
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
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.error = nil
                        
                        if areFieldsValid() {
                            isContiuing.toggle()
                        } else {
                            error = "Invalid email, please try again."
                        }
                    }) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(Color.theme.background)
                            .frame(width: 150, height: 50)
                            .background(Color.theme.accent)
                            .cornerRadius(8)
                            .padding(.trailing, 28)
                    }
                }
                .padding(.bottom)
            }
        }
    }
}

extension EnterEmailView {
    func areFieldsValid() -> Bool {
        if !email.isEmpty, isValidEmail(email: email) {
            return true
        }
        
        return false
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
}

struct EnterUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EnterEmailView()
        }
    }
}
