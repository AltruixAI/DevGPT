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
    @State private var selectedResponse: Response? = nil
    @State private var isNavigatingToResponse: Bool = false
    
    let user: User
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            if let responses = user.responses {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("History")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color.theme.accent)
                            .padding(.leading, 18)
                            .padding(.top, 68)
                        
                        VStack(alignment: .center) {
                            ForEach(responses) { response in
                                Button {
                                    self.selectedResponse = response
                                    self.isNavigatingToResponse = true
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

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
