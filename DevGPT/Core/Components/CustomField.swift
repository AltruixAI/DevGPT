//
//  CustomField.swift
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

struct CustomField: View {
    // Text the user has typed
    @Binding var text: String
    @State private var isTapped: Bool = false
    
    // Placeholder text
    let placeholder: String
    // the name of the icon on the left side of the TextField
    let imageName: String?
    // Determines if the CustomField uses a SecureField or TextField
    let isSecure: Bool
    // Main Body View for the custom field
    var body: some View {
        VStack {
            HStack {
                if isSecure {
                    SecureField("", text: $text)
                        .foregroundColor(Color.theme.accent)
                        .placeholder(when: text.isEmpty) {
                            Text(placeholder)
                                .foreground(Color.theme.accent)
                        }
                        .placeholder(when: !text.isEmpty) {
                            withAnimation(.easeInOut) {
                                Text(placeholder)
                                    .foreground(Color.theme.accent)
                                    .font(.system(size: 10))
                                    .offset(y: -10)
                                    .padding(.bottom)
                            }
                        }
                } else {
                    TextField("", text: $text)
                        .foregroundColor(Color.theme.accent)
                        .placeholder(when: text.isEmpty) {
                            Text(placeholder)
                                .foreground(Color.theme.accent)
                        }
                        .placeholder(when: !text.isEmpty) {
                            withAnimation(.linear) {
                                Text(placeholder)
                                    .foreground(Color.theme.accent)
                                    .font(.system(size: 10))
                                    .offset(y: -10)
                                    .padding(.bottom)
                            }
                        }
                }
            }
            
            Divider()
                .frame(height: 3)
                .overlay(Color.white)
        }
    }
}


struct CustomField_Previews: PreviewProvider {
    struct CustomFieldHelper: View {
        @State private var text: String = ""
        
        var body: some View {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                CustomField(text: $text, placeholder: "Text", imageName: "person.fill", isSecure: false)
            }
        }
    }
    
    static var previews: some View {
        CustomFieldHelper()
    }
}
