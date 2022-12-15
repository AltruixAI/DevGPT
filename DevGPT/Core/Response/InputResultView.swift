//
//  InputResultView.swift
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

struct InputResultView: View {
    let input: String
    let imageURL: String
    
    var body: some View {
        HStack() {
            KFImage(URL(string: imageURL))
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.leading)
            
            Text(input)
                .font(Font.custom("Poppins", size: 16))
                .lineLimit(3)
                .minimumScaleFactor(0.85)
                .multilineTextAlignment(.leading)
                .padding(.leading, 28)
                .foregroundColor(Color.theme.accent)
            
            Spacer()
        }
        .background(
            Rectangle()
                .frame(width: UIScreen.main.bounds.width)
                .foregroundColor(Color.theme.inputBackground)
                .padding(.vertical, -20)
        )
    }
}

struct InputResultView_Previews: PreviewProvider {
    static var previews: some View {
        InputResultView(input: "This is a test.", imageURL: "https://yt3.ggpht.com/ygrMbZl0OZSesSJY6cJfcRoQAwKU7WcodAvS1HAHhhQftBLKG9x5su5uFXXlhaLaUqCbywspZyg=s48-c-k-c0x00ffffff-no-rj")
            .previewLayout(PreviewLayout.fixed(width: UIScreen.main.bounds.width, height: 100))
    }
}
