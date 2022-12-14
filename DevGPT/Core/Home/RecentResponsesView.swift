//
//  RecentResponsesView.swift
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
import Kingfisher

struct RecentResponsesView: View {
    let responses: [Response]?
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent")
                    .font(Font.custom("Poppins", size: 28))
                    .foregroundColor(Color.theme.accent)
                    .padding(.leading)
                
                Spacer()
            }
            if let responses = responses, !responses.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(responses) { response in
                            NavigationLink {
                                ResponseRelayView(user: user, outputResponse: response).navigationBarBackButtonHidden(true)
                            } label: {
                                ResponseThumbnailView(response: response)
                            }
                        }
                    }
                }
            } else {
                Text("Your have not asked anything yet.\nStart adding some by generating a code idea.")
                    .font(Font.custom("Poppins", size: 14))
                    .foregroundColor(Color.theme.accent)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 50)
            }
        }
    }
}

struct RecentResponsesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecentResponsesView(responses: [dev.response1], user: dev.user)
        }
    }
}
