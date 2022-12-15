//
//  HomeUserBarView.swift
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

struct HomeUserBarView: View {
    let user: User
    
    var body: some View {
        HStack {
            if let profileImage = user.profileImageUrl {
                KFImage(URL(string: profileImage))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.leading, 18)
            } else {
                Circle()
                    .foregroundColor(Color.theme.accent)
                    .frame(width: 50, height: 50)
                    .padding(.leading, 18)
            }
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(Font.custom("Poppins", size: 18))
                    .foregroundColor(Color.theme.accent)
                
                Text(user.email)
                    .font(Font.custom("Poppins", size: 12))
                    .foregroundColor(Color.theme.accent)
                    .tint(Color.theme.accent)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(Color.theme.accent)
                    .rotationEffect(Angle(degrees: 90.0))
                    .padding(.trailing, 18)
            }

        }
    }
}

struct HomeUserBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUserBarView(user: dev.user)
    }
}
