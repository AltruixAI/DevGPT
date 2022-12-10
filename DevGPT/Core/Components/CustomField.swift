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
  // Placeholder text
  let placeholder: Text
  // the name of the icon on the left side of the TextField
  let imageName: String?
  // Determines if the CustomField uses a SecureField or TextField
  let isSecure: Bool
  // Main Body View for the custom field
  var body: some View {
    // Main ZStack: (if the text is empty / "") placeholder -> HStack: Icon -> (if isSecure is true) SecureField, else TextField
    ZStack(alignment: .leading) {
      if text.isEmpty {
        placeholder
              .foregroundColor(Color(.black))
          .padding(.leading, 30)
      }
      HStack {
        // Icon
        Image(systemName: imageName ?? "lock")
          .resizable()
          .scaledToFit()
          .frame(width: 20, height: 20)
          .foregroundColor(Color(.black))
        if isSecure {
          // Secure Field (isSecure is true)
          SecureField("", text: $text)
                .foregroundColor(Color(.black))
        } else {
          // Text Field (isSecure is false)
          TextField("", text: $text)
                .foregroundColor(Color(.black))
        }
      }
    }
      .padding()
      .background(Color(.black).opacity(0.15))
      .cornerRadius(10)
      .padding(.horizontal, 32)
  }
}


struct CustomField_Previews: PreviewProvider {
    struct CustomFieldHelper: View {
        @State private var text: String = ""
        
        var body: some View {
            CustomField(text: $text, placeholder: Text("Text"), imageName: "person.fill", isSecure: false)
        }
    }
    
    static var previews: some View {
        CustomFieldHelper()
    }
}
