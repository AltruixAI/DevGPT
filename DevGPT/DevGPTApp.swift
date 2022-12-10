//
//  DevGPTApp.swift
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
import Firebase

@main
struct DevGPTApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            DevGPTSwitcher()
                .environmentObject(AuthenticationViewModel.shared)
        }
    }
}

struct DevGPTSwitcher: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var animate = false
    @State private var endSplash = false
    
    var body: some View {
        ZStack {
            Group {
                if authenticationViewModel.userSession != nil,
                   let user = authenticationViewModel.currentUser {
                    TabBar(user: user)
                } else {
                    OnboardingView()
                }
            }
            
            ZStack {
                Color(.white)
              
              Image("splash")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: animate ? .fill : .fit)
                .frame(width: animate ? nil : 110, height: animate ? nil : 22)
              
                .scaleEffect(animate ? 3 : 1)
              
                .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.65) {
            
            withAnimation(Animation.easeOut(duration: 0.85)){
                animate.toggle()
            }
            
            withAnimation(Animation.easeOut(duration: 0.75)){
                endSplash.toggle()
            }
            
        }
    }
}
