//
//  ThirdPageView.swift
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

struct ThirdPageView: View {
    @Binding var username: String
    
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @State var imagePickerPresented = false
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                // Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width - 250)
                    .padding(.vertical, 20)
                    .offset(y: 15)
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 24))
                            .padding(.top, 24)
                            .padding(.leading, 24)
                            .tint(Color.theme.accent)
                    }
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("Add profile picture")
                            .font(.system(size: 38))
                            .foregroundColor(Color.theme.accent)
                            .padding(.top, 34)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Choose a profile picture that represents you!")
                            .font(.system(size: 16))
                            .foregroundColor(Color.theme.accent)
                            .padding(.leading, 28)
                            .padding(.top, -12)
                        
                        Spacer()
                    }
                    
                    HStack {
                        if let profileImage = profileImage {
                            Button {
                                imagePickerPresented = true
                            } label: {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 160, height: 160)
                                    .clipShape(Circle())
                                    .padding(.leading, 28)
                                    .padding(.top)
                            }
                            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                                ImagePicker(image: $selectedImage)
                            })
                        } else {
                            Button {
                                imagePickerPresented = true
                            } label: {
                                Image("profilePic")
                                    .padding(.leading, 28)
                                    .padding(.top)
                            }
                            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                                ImagePicker(image: $selectedImage)
                            })
                        }

                        Spacer()
                        
                        Text(username)
                            .font(Font.custom("Poppins", size: 24))
                            .foregroundColor(Color.theme.accent)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("or choose a DevGPT avatar")
                            .font(.system(size: 16))
                            .foregroundColor(Color.theme.accent)
                            .padding(.leading, 28)
                            .padding(.top, 12)
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 46) {
                        Button {
                            profileImage = Image("Group 77")
                        } label: {
                            Image("Group 77")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }

                        
                        Button {
                            profileImage = Image("Group 81")
                        } label: {
                            Image("Group 81")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            profileImage = Image("Group 79")
                        } label: {
                            Image("Group 79")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            profileImage = Image("Group 84")
                        } label: {
                            Image("Group 84")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                    }
                    .padding(.top, 24)
                    
                    HStack(spacing: 46) {
                        Button {
                            profileImage = Image("Group 80")
                        } label: {
                            Image("Group 80")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            profileImage = Image("Group 82")
                        } label: {
                            Image("Group 82")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            profileImage = Image("Group 86")
                        } label: {
                            Image("Group 86")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            profileImage = Image("Group 87")
                        } label: {
                            Image("Group 87")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                    }
                    .padding(.top, 14)
                }
                
                Spacer()
                
                HStack {
                    Button(action: {  }) {
                        Text("Skip")
                            .font(.headline)
                            .foregroundColor(Color.theme.accent)
                            .frame(width: 150, height: 50)
                            .background(
                                ZStack {
                                    Color.theme.accent
                                    
                                    Color.theme.background
                                        .frame(width: 145, height: 45)
                                        .cornerRadius(8)
                                }
                            )
                            .cornerRadius(8)
                            .padding(.leading, 24)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.linear) {
                        }
                    }) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(Color.theme.background)
                            .frame(width: 150, height: 50)
                            .background(Color.theme.accent)
                            .cornerRadius(8)
                            .padding(.trailing, 24)
                    }
                }
            }
        }
    }
}

extension ThirdPageView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ThirdPageView_Previews: PreviewProvider {
    struct previewHandler: View {
        @State private var username: String = "MarcoDotIO"
        
        var body: some View {
            ThirdPageView(username: $username)
        }
    }
    
    static var previews: some View {
        previewHandler()
    }
}
