//
//  OnboardingView.swift
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

struct OnboardingView: View {
    @State var pageNumber: Int = 1
    @State var pageNumberAnimated: Int = 1
    @State var showRegistrationOnboard: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // Logo
                Text("Logo")
                    .font(.headline)
                    .padding(.vertical, 20)
                    .offset(y: 15)
                
                // Template image
                imageHeadline
                
                // Template text
                textHeadline
                
                // Progression dots
                onboardProgression
                Spacer()
                
                // Bottom Buttons
                onboardButtons
            }
            .background(
                NavigationLink(destination: OnboardingRegistrationView(), isActive: $showRegistrationOnboard, label: {
                    EmptyView()
                })
        )
        }
    }
}

extension OnboardingView {
    private var imageHeadline: some View {
        ZStack {
            if pageNumberAnimated == 1 {
                ImageOnboardingView(imageName: "templateOnboardingImage1")
                    .transition(.move(edge: .leading))
            } else if pageNumberAnimated == 2 {
                ImageOnboardingView(imageName: "templateOnboardingImage2")
                    .transition(.move(edge: .trailing))
            } else if pageNumberAnimated == 3 {
                ImageOnboardingView(imageName: "templateOnboardingImage3")
                    .transition(.move(edge: .leading))
            }
        }
    }
    
    private var textHeadline: some View {
        ZStack {
            if pageNumber == 1 {
                Text("Insert Onboarding text\nMessage #1")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .padding(.top, 40)
            } else if pageNumber == 2 {
                Text("Insert Onboarding text\nMessage #2")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .padding(.top, 40)
            } else if pageNumber == 3 {
                Text("Insert Onboarding text\nMessage #3")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .padding(.top, 40)
            }
        }
    }
    
    private var onboardProgression: some View {
        HStack {
            Circle()
                .frame(width: 15, height: 15)
                .padding(.top, 40)
                .foregroundColor(pageNumber == 1 ? Color(.systemGray4) : .white)
                .background(
                    Circle()
                        .fill(Color(.systemGray))
                        .frame(width: 20, height: 20)
                        .padding(.top, 40)
                )
            
            Circle()
                .frame(width: 15, height: 15)
                .padding(.top, 40)
                .foregroundColor(pageNumber == 2 ? Color(.systemGray4) : .white)
                .background(
                    Circle()
                        .fill(Color(.systemGray))
                        .frame(width: 20, height: 20)
                        .padding(.top, 40)
                )
                .padding(.horizontal, 8)
            
            Circle()
                .frame(width: 15, height: 15)
                .padding(.top, 40)
                .foregroundColor(pageNumber == 3 ? Color(.systemGray4) : .white)
                .background(
                    Circle()
                        .fill(Color(.systemGray))
                        .frame(width: 20, height: 20)
                        .padding(.top, 40)
                )
        }
        
    }
    
    private var onboardButtons: some View {
        HStack(spacing: 0) {
            Button {
                showRegistrationOnboard.toggle()
            } label: {
                Text("Skip")
            }
            .padding(.leading, 40)
            
            Spacer()
            
            Button {
                if pageNumber != 3 {
                    pageNumber += 1
                } else {
                    showRegistrationOnboard.toggle()
                }
                
                withAnimation(.easeIn) {
                    if pageNumberAnimated != 3 {
                        pageNumberAnimated += 1
                    }
                }
            } label: {
                Text("Next")
            }
            .padding(.trailing, 40)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
