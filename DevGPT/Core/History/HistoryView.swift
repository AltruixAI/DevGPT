//
//  HistoryView.swift
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

struct HistoryView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var selectedResponse: Response? = nil
    @State private var isNavigatingToResponse: Bool = false
    
    let user: User
    
    var body: some View {
        ZStack {
            Color.theme.statusBar.ignoresSafeArea()
            
            Color.theme.background.ignoresSafeArea(edges: [.bottom])
                .padding(.top, 5)
            
            if let response = selectedResponse {
                NavigationLink(destination: ResponseView(user: user, outputResponse: response).navigationBarBackButtonHidden(true), isActive: $isNavigatingToResponse, label: { EmptyView() })
            }
            
            if let responses = user.responses {
                VStack {
                    HStack {
                        Text("History")
                            .font(Font.custom("Poppins", size: 28))
                            .foregroundColor(Color.theme.accent)
                            .padding(.top, 40)
                            .padding(.leading, 14)
                        
                        Spacer()
                    }
                    
                    ScrollView {
                        VStack(alignment: .center) {
                            ForEach(responses) { response in
                                Button {
                                    self.selectedResponse = response
                                    self.isNavigatingToResponse.toggle()
                                } label: {
                                    HistoryTabs(response: response)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HistoryView(user: dev.user)
                .environmentObject(AuthenticationViewModel.shared)
        }
    }
}
