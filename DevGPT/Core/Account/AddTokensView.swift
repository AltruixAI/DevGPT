//
//  AddTokensView.swift
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

struct AddTokensView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = AddTokensViewModel()
    
    @Binding var tokens: Int
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "bitcoinsign.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .offset(y: -270)
                
                Text("\(tokens + (Int(viewModel.value) ?? 0))")
                    .font(.system(size: 60))
                    .bold()
                    .offset(y: -270)
            }
            
            TextField("0", text: $viewModel.value)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .font(.title)
                .textFieldStyle(.plain)
                .offset(y: -220)
                .frame(width: 200)
                .keyboardType(.decimalPad)
            
            Text(((Int(viewModel.value) ?? 0) >= 100) ? "Adding \(viewModel.value) Tokens" : "Minimum Amount 100")
                .offset(y: -210)
                .foregroundColor(((Int(viewModel.value) ?? 0) >= 100) ? .black : Color(uiColor: .systemGray4))
        }
        .offset(y: 110)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }

            }
            
            ToolbarItem(placement: .principal) {
                Text("Select Amount")
                    .bold()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Text("Add")
                }

            }
        }
    }
}

//struct AddTokensView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            AddTokensView()
//        }
//    }
//}
