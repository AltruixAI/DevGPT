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

struct InputResultView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.bottom, 48)
                .padding(.horizontal)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a elit risus. Nullam non tortor ac augue malesuada tempor. Curabitur varius tortor purus, nec condimentum leo vulputate id.")
                .lineLimit(4)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
                .padding(.trailing)
        }
    }
}

struct InputResultView_Previews: PreviewProvider {
    static var previews: some View {
        InputResultView()
            .previewLayout(PreviewLayout.fixed(width: UIScreen.main.bounds.width, height: 100))
    }
}
