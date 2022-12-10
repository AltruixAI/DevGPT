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
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(.horizontal)
                    .padding(.top, 70)
                
                Spacer()
            }
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a elit risus. Nullam non tortor ac augue malesuada tempor. Curabitur varius tortor purus, nec condimentum leo vulputate id. Praesent malesuada convallis posuere. Morbi blandit pharetra purus, et cursus erat ultricies quis. Morbi nec dui nec ex rutrum interdum et id turpis. Sed ultrices venenatis risus, euismod congue nulla tincidunt et. Nullam at vehicula dui. Proin tristique aliquam ipsum in mollis. Proin nec ante a nisl vehicula dignissim.")
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 160, height: 500)
                .offset(y: -100)
                .background(
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width - 80, height: 400)
                        .cornerRadius(10)
                        .padding(.leading, 56)
                        .padding(.bottom, 90)
                        .foregroundColor(Color(uiColor: .systemGray2))
                        .offset(y: -50)
                )
        }
    }
}

struct ChatResponseView_Previews: PreviewProvider {
    static var previews: some View {
        ChatResponseView()
            .previewLayout(PreviewLayout.fixed(width: UIScreen.main.bounds.width, height: 500))
    }
}
