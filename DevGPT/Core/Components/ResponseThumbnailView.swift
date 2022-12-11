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
        if let thumbnail = response.thumbnail {
            ZStack {
                KFImage(URL(string: thumbnail))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 100)
                    .cornerRadius(10)
                    .overlay(
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(Color.theme.tab)
                                    .frame(width: 170, height: 100)
                                    .cornerRadius(10)
                                    .padding(.top, 70)
                                    .offset(x: -10)
                                    .opacity(0.75)
                                
                                Text("Project 1")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                    .bold()
                            }
                        }
                            .mask(
                                KFImage(URL(string: thumbnail))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 100)
                                    .cornerRadius(10)
                            )
                    )
            }
        }
    }
    
    private var baseThumbnail: some View {
        Image("templateResponseThumbnail")
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 100)
            .cornerRadius(10)
    }
}

//struct ResponseThumbnailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResponseThumbnailView()
//    }
//}
