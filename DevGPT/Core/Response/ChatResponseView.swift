//
//  ChatResponseView.swift
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

struct ChatResponseView: View {
    let output: String
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding(.horizontal)
                }
                
                Text(output)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
            }
        }
        .background(
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 80)
                .cornerRadius(10)
                .padding(.leading, 56)
                .foregroundColor(Color(uiColor: .systemGray2))
        )
    }
}

struct ChatResponseView_Previews: PreviewProvider {
    static var previews: some View {
        ChatResponseView(output: "Lorem ipsum")
            .previewLayout(PreviewLayout.fixed(width: UIScreen.main.bounds.width, height: 500))
    }
}
