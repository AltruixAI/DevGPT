//
//  RegistrationView.swift
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

struct RegistrationView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @Environment(\.presentationMode) var mode
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @State var imagePickerPresented = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    if profileImage == nil {
                        Button(
                            action: {
                                imagePickerPresented.toggle()
                            }) {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFill()
                                    .frame(width: 180, height: 180)
                                    .clipped()
                            }
                            .accentColor(Color.theme.accent)
                            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                                ImagePicker(image: $selectedImage)
                            })
                    } else if let profileImage = profileImage {
                        VStack(spacing: 128) {
                            HStack(alignment: .top) {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 180, height: 180)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
                .padding(.top, 120)
                .padding(.bottom, 20)
                
                VStack(spacing: 20) {
                    CustomField(
                        text: $email,
                        placeholder: "Email",
                        imageName: "envelope",
                        isSecure: false
                    )
                    .padding(.horizontal)
                    
                    CustomField(
                        text: $username,
                        placeholder: "Username",
                        imageName: "person",
                        isSecure: false
                    )
                    .padding(.horizontal)
                    
                    CustomField(
                        text: $password,
                        placeholder: "Password",
                        imageName: nil,
                        isSecure: true
                    )
                    .padding(.horizontal)
                }
                
                Button {
                    authenticationViewModel.register(
                        withEmail: email,
                        password: password,
                        username: username,
                        image: selectedImage
                    ) { _ in }
                } label: {
                    Text("Sign Up")
                      .font(.headline)
                      .foregroundColor(Color.theme.background)
                      .frame(width: 360, height: 50)
                      .background(Color.theme.accent)
                      .clipShape(Capsule())
                      .padding()
                }
                
                Spacer()
            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
