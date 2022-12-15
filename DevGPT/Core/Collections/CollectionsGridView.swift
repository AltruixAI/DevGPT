//
//  CollectionsGridView.swift
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

struct CollectionsGridView: View {
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 35),
        GridItem(.flexible(), spacing: 30)
    ]
    
    private let spacing: CGFloat = 20
    
    let collections: [Collection]?
    
    var body: some View {
        ScrollView {
            if let collections = collections {
                VStack(alignment: .leading) {
                    LazyVGrid(
                        columns: columns,
                        alignment: .leading,
                        spacing: spacing,
                        pinnedViews: []) {
                            ForEach(collections) { collection in
                                HStack {
                                    CollectionThumbnailView(collection: collection)
                                }
                            }
                        }
                        .padding(.trailing, 23)
                        .padding(.leading, 6)
                }
            }
        }
    }
}

struct CollectionsGridView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CollectionsGridView(collections: [dev.collection])
        }
    }
}
