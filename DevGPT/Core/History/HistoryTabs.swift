//
//  HistoryTabs.swift
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

struct HistoryTabs: View {
    let response: Response
    
    var body: some View {
        VStack {
            HStack {
                Text(response.response.trimmingCharacters(in: .whitespacesAndNewlines))
                    .font(Font.custom("Poppins", size: 18))
                    .foregroundColor(Color.theme.accent)
                    .lineLimit(3)
                
                Spacer()
            }
            
            HStack {
                Text("A few minutes ago")
                    .font(Font.custom("Poppins", size: 12))
                    .foregroundColor(Color.theme.accent.opacity(0.5))
                    .padding(.top, 4)
                
                Spacer()
                
                Image("swift")
            }
        }
        .padding()
        .background(
            Rectangle()
                .foregroundColor(Color.theme.textField)
                .frame(width: UIScreen.main.bounds.width - 20)
                .cornerRadius(10)
        )
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width - 20)
    }
}

struct HistoryTabs_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTabs(response: Response(id: "1", prompt: "This is a test", response: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip commodo consequat.", language: "Swift"))
    }
}
