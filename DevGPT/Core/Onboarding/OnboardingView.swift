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
            ZStack {
                Color.theme.statusBar.ignoresSafeArea()
                
                Color.theme.background.ignoresSafeArea(edges: [.bottom])
                    .padding(.top, 5)
                
                VStack {
                    // Logo
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 250)
                        .padding(.vertical, 15)
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
}

extension OnboardingView {
    private var imageHeadline: some View {
        ZStack {
            if pageNumberAnimated == 1 {
                ImageOnboardingView(imageName: "onboard1")
                    .transition(.move(edge: .leading))
            }
        }
    }
    
    private var textHeadline: some View {
        ZStack {
            if pageNumber == 1 {
                Text("DevGPT makes sure you never lose sight of a great feature idea again.")
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("Poppins", size: 18))
                    .fontWeight(.medium)
                    .padding(.top, 40)
                    .padding(.horizontal, 60)
                    .foregroundColor(Color.theme.accent)
            } else if pageNumber == 2 {
                Text("All your feature ideas for all your projects in one place. Share, copy or air drop it wherever you want!")
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("Poppins", size: 18))
                    .fontWeight(.medium)
                    .padding(.top, 180)
                    .padding(.horizontal, 40)
                    .foregroundColor(Color.theme.accent)
            } else if pageNumber == 3 {
                Text("By saving code answers in collections, you'll be ready for spur-of-the-moment thinking.")
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("Poppins", size: 18))
                    .fontWeight(.medium)
                    .padding(.top, 180)
                    .padding(.horizontal, 40)
                    .foregroundColor(Color.theme.accent)
            }
        }
    }
    
    private var onboardProgression: some View {
        HStack {
            Circle()
                .frame(width: 15, height: 15)
                .padding(.top, 40)
                .foregroundColor(pageNumber == 1 ? Color.theme.accent : Color.theme.background)
                .background(
                    Circle()
                        .fill(Color.theme.accent)
                        .frame(width: 20, height: 20)
                        .padding(.top, 40)
                )
            
            Circle()
                .frame(width: 15, height: 15)
                .padding(.top, 40)
                .foregroundColor(pageNumber == 2 ? Color.theme.accent : Color.theme.background)
                .background(
                    Circle()
                        .fill(Color.theme.accent)
                        .frame(width: 20, height: 20)
                        .padding(.top, 40)
                )
                .padding(.horizontal, 8)
            
            Circle()
                .frame(width: 15, height: 15)
                .padding(.top, 40)
                .foregroundColor(pageNumber == 3 ? Color.theme.accent : Color.theme.background)
                .background(
                    Circle()
                        .fill(Color.theme.accent)
                        .frame(width: 20, height: 20)
                        .padding(.top, 40)
                )
        }
        
    }
    
    private var onboardButtons: some View {
        HStack(spacing: 0) {
            Button(action: { showRegistrationOnboard.toggle() }) {
                Text("Skip")
                    .font(Font.custom("Poppins", size: 18))
                    .foregroundColor(Color.theme.accent)
                    .frame(width: 150, height: 50)
                    .background(
                        ZStack {
                            Color.theme.accent
                            
                            Color.theme.background
                                .frame(width: 145, height: 45)
                                .cornerRadius(8)
                        }
                    )
                    .cornerRadius(8)
                    .padding(.leading, 24)
            }
            
            Spacer()
            
            Button(action: {
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
            }) {
                Text("Next")
                    .font(Font.custom("Poppins", size: 18))
                    .foregroundColor(Color.theme.background)
                    .frame(width: 150, height: 50)
                    .background(Color.theme.accent)
                    .cornerRadius(8)
                    .padding(.trailing, 24)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
