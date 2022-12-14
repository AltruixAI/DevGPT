//
//  ResponseThumbnailView.swift
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

struct ResponseThumbnailView: View {
    let response: Response
    
    var body: some View {
        ZStack {
            if let thumbnail = response.thumbnail {
                KFImage(URL(string: thumbnail))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 125)
                    .cornerRadius(20)
                    .overlay(overlayView.mask(
                        KFImage(URL(string: thumbnail))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 175, height: 125)
                            .cornerRadius(20)
                            .foregroundColor(Color.theme.accent)
                    ))
            } else {
                Rectangle()
                    .frame(width: 175, height: 125)
                    .cornerRadius(20)
                    .foregroundColor(Color.theme.textField)
                    .overlay(
                        overlayView.mask(
                            Rectangle()
                                .frame(width: 175, height: 125)
                                .cornerRadius(20)
                                .foregroundColor(Color.theme.accent)
                        )
                    )
            }
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .foregroundColor(Color.theme.tab)
                    .frame(width: 195, height: 145)
                    .padding(.top, 90)
                    .offset(x: -10)
                    .opacity(0.75)
                
                HStack {
                    Text(response.prompt)
                        .padding(.leading, 10)
                        .padding(.bottom)
                        .multilineTextAlignment(.trailing)
                        .font(Font.custom("Poppins", size: 16))
                        .foregroundColor(Color.theme.accent.opacity(0.75))
                        .frame(width: 168, height: 150, alignment: .leading)
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: true)
                    
                    Spacer()
                }
            }
        }
    }
}

struct ResponseThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ResponseThumbnailView(response: Response(id: "1v", prompt: "This is a test", response: "This is a test", language: "Swift"))
    }
}
