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
    let user: User
    
    var body: some View {
        NavigationStack {
            TabView {
                Group {
                    HomeView(user: user)
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    
//                    AllCollectionsView(user: user)
//                        .tabItem {
//                            Image(systemName: "folder.fill")
//                            Text("Collections")
//                        }
                    
                    HistoryView(user: user)
                        .tabItem {
                            Image(systemName: "stopwatch.fill")
                            Text("History")
                        }
                    
                    AccountView(user: user)
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                    
                    SettingsView()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
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

//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            TabBar()
//        }
//    }
//}
