//
//  NegativeFeedbackView.swift
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

struct NegativeFeedbackView: View {
    @State private var feedbackText: String = ""
    @State private var harmfulChecked: Bool = false
    @State private var trueChecked: Bool = false
    @State private var helpfulChecked: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .opacity(0.25)
            
            VStack(alignment: .leading) {
                Text("Provide additional feedback")
                    .font(.headline)
                    .bold()
                    .padding(.leading)
                
                TextField("Enter Feedback...", text: $feedbackText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .padding(.top, 4)
                
                HStack {
                    CheckBoxView(checked: $harmfulChecked)
                    Text("This is harmful or unsafe.")
                }
                .padding(.leading)
                .padding(.top)
                
                HStack {
                    CheckBoxView(checked: $trueChecked)
                    Text("This isn't true.")
                }
                .padding(.leading)
                .padding(.top, 2)
                
                HStack {
                    CheckBoxView(checked: $helpfulChecked)
                    Text("This isn't helpful.")
                }
                .padding(.leading)
                .padding(.top, 2)
                
                AppPrimaryButton("Submit Feedback") {
                    
                }
                .padding(.leading)
            }
            .background(
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.vertical, -16)
            )
            .frame(width: UIScreen.main.bounds.width - 80)
        }
    }
}

struct NegativeFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        NegativeFeedbackView()
    }
}
