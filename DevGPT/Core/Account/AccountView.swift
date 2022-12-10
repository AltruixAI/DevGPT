//
//  AccountView.swift
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

struct AccountView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.top, 110)
            
            Text("Marcus Arnett")
                .font(.title)
                .bold()
                .padding(.top, 24)
            
            Text("Marcus.Arnett10@gmail.com")
                .padding(.top, -8)
            
            HStack {
                Text("100")
                    .font(.system(size: 60))
                    .bold()
                
                Image(systemName: "bitcoinsign.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
            .padding(.top, 68)
            
            AppPrimaryButton("Add Tokens +") {
                
            }
            
            Spacer()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
