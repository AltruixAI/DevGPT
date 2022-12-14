//
//  OnboardingRegistrationView.swift
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

struct OnboardingRegistrationView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var isRegisteringAccount: Bool = false
    @State private var isLoggingInWithAccount: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.statusBar.ignoresSafeArea()
            
            Color.theme.background.ignoresSafeArea(edges: [.bottom])
                .offset(y: 70)
            
            VStack {
                // Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width - 250, height: 50)
                    .padding(.top, 88)
                
                // Tageline
                tagline
                
                Spacer()
                
                // Continue with Buttons
                continueButtons
                
                divider
                
                registrationButton
                
                Spacer()
                
                loginButton
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                isRegisteringAccount = false
                isLoggingInWithAccount = false
        }
        }
    }
}

extension OnboardingRegistrationView {
    private var tagline: some View {
        Text("Integrate DevGPT\ninto your workflow and\nshoot your\nproductivity\nthrough the roof!")
            .font(Font.custom("Poppins", size: 28))
            .minimumScaleFactor(1.75)
            .fixedSize(horizontal: false, vertical: true)
            .bold()
            .padding(.top, 90)
            .padding(.bottom, 80)
            .padding(.horizontal, 40)
            .foregroundColor(Color.theme.accent)
    }
    
    private var continueButtons: some View {
        VStack(spacing: 15) {
            AppPrimaryButton("Continue with Google") {
                
            }
            
            AppPrimaryButton("Continue with Apple") {
                
            }
        }
        .padding(.bottom, 8)
    }
    
    private var divider: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 1)
                .overlay(.gray.opacity(0.8))
                .frame(width: UIScreen.main.bounds.width - 260, height: 10)
                .offset(x: -20)
            
            Text("or")
                .foregroundColor(.gray.opacity(0.8))
                .font(Font.custom("Poppins", size: 16))
                .bold()
                .offset(x: -20)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 1)
                .overlay(.gray.opacity(0.8))
                .frame(width: UIScreen.main.bounds.width - 260, height: 10)
                .offset(x: -20)
        }
        .padding(.leading, 40)
        .padding(.bottom, 8)
    }
    
    private var registrationButton: some View {
        ZStack {
            NavigationLink(
                destination: FirstPageView().navigationBarBackButtonHidden(true),
                isActive: $isRegisteringAccount,
                label: { EmptyView() }
            )
            
            AppPrimaryButton("Create an account") {
                isRegisteringAccount.toggle()
            }
                .padding(.bottom, 50)
        }
    }
    
    private var loginButton: some View {
        HStack {
            NavigationLink(
                destination: EnterEmailView().navigationBarBackButtonHidden(true),
                isActive: $isLoggingInWithAccount,
                label: { EmptyView() }
            )
            
            Text("Have an account already?")
                .foregroundColor(Color.theme.accent)
            
            Button {
                isLoggingInWithAccount.toggle()
            } label: {
                Text("Log in").underline().bold()
            }
            .tint(Color.theme.highlight)

        }
        .padding(.bottom, 64)
        .padding(.top, 70)
    }
}

struct OnboardingRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OnboardingRegistrationView()
        }
    }
}
