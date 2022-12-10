//
//  AddToCollectionView.swift
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

struct AddToCollectionView: View {
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let spacing: CGFloat = 20
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Choose Collection")
                    .font(.title)
                    .bold()
                    .padding(.leading, 6)
                    .padding(.top, 68)
                
                LazyVGrid(
                    columns: columns,
                    alignment: .leading,
                    spacing: spacing,
                    pinnedViews: []) {
                        ForEach(0..<4) { _ in
//                            CollectionThumbnailView()
//                                .padding(.leading, 4)
                        }
                        
                        Button {
                            
                        } label: {
                            Rectangle()
                                .foregroundColor(Color(uiColor: .systemGray2))
                                .frame(width: 200, height: 150)
                                .cornerRadius(10)
                                .padding(.leading, 4)
                                .overlay(
                                    Image(systemName: "plus.square")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                )
                        }

                    }
            }
        }
    }
}

struct AddToCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCollectionView()
    }
}
