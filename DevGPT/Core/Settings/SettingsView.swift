//
//  SettingsView.swift
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

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Settings")
                .font(.title)
                .bold()
                .padding(.trailing, 288)
                .padding(.top, 68)
            
            List {
                Section {
                    HStack {
                        Text("Change Avatar")
                            .padding(.leading)
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                .onTapGesture {
                    
                }
                .listRowBackground(Color.clear)
                
                Section {
                    HStack {
                        Text("Change Username")
                            .padding(.leading)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                .onTapGesture {
                    
                }
                .listRowBackground(Color.clear)
                
                Section {
                    HStack {
                        Text("Change Email")
                            .padding(.leading)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                .onTapGesture {
                    
                }
                .listRowBackground(Color.clear)
                
                Section {
                    HStack {
                        Text("Change Password")
                            .padding(.leading)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                .onTapGesture {
                    
                }
                .listRowBackground(Color.clear)
            }
            .scrollDisabled(true)
            .font(.headline)
            .listStyle(.plain)
            
            AppPrimaryButton("Log out") {
                
            }
            .padding(.bottom, 86)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView()
        }
    }
}
