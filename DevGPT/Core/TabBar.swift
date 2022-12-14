//
//  TabBar.swift
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

struct TabBar: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var selectedTab = 1
    
    let user: User
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                Group {
                    HomeView(user: user)
                        .tabItem {
                            Image(selectedTab == 1 ? "homeSelected" : "home")
                            
                            if selectedTab == 1 {
                                Text("Home")
                                    .font(Font.custom("Poppins", size: 8))
                                    .foregroundColor(Color.theme.accent)
                            }
                        }
                        .tag(1)
                    
                    AllCollectionsView(user: user)
                        .tabItem {
                            Image("collections")
                            
                            if selectedTab == 2 {
                                Text("Collections")
                                    .font(Font.custom("Poppins", size: 8))
                                    .foregroundColor(Color.theme.accent)
                            }
                        }
                        .tag(2)
                    
                    HistoryView(user: user)
                        .tabItem {
                            Image("history")
                            
                            if selectedTab == 3 {
                                Text("History")
                                    .font(Font.custom("Poppins", size: 8))
                                    .foregroundColor(Color.theme.accent)
                            }
                        }
                        .tag(3)
                    
                    SettingsView()
                        .tabItem {
                            Image("settings")
                            
                            if selectedTab == 4 {
                                Text("Settings")
                                    .font(Font.custom("Poppins", size: 8))
                                    .foregroundColor(Color.theme.accent)
                            }
                        }
                        .tag(4)
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.theme.statusBar, for: .tabBar)
            }
            .accentColor(Color.theme.accent)
        }
        .onAppear {
            authenticationViewModel.fetchUser()
        }
    }
}
