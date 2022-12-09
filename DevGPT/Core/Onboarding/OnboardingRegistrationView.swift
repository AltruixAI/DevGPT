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
    var body: some View {
        VStack {
            // Logo
            Text("Logo")
                .font(.headline)
                .padding(.vertical, 20)
                .offset(y: 15)
            
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
    }
}

extension OnboardingRegistrationView {
    private var tagline: some View {
        Text("Cool Tagline")
            .font(.title)
            .bold()
            .padding(.top, 140)
            .padding(.bottom, 80)
    }
    
    private var continueButtons: some View {
        VStack(spacing: 15) {
            AppPrimaryButton("Continue with Google") {
                
            }
            
            AppPrimaryButton("Continue with Apple") {
                
            }
        }
        .padding(.bottom, 15)
    }
    
    private var divider: some View {
        Divider()
            .frame(height: 1)
            .overlay(.gray)
            .frame(width: UIScreen.main.bounds.width - 70, height: 10)
            .padding(.bottom, 5)
    }
    
    private var registrationButton: some View {
        AppPrimaryButton("Create an account") {
            
        }
        .padding(.bottom, 50)
    }
    
    private var loginButton: some View {
        HStack {
            Text("Have an account already?")
            
            Button {
                
            } label: {
                Text("Log in").underline().bold()
            }

        }
        .padding(.bottom, 64)
    }
}

struct OnboardingRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingRegistrationView()
    }
}
