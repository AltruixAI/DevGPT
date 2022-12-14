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
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @Binding var username: String
    @Binding var email: String
    
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State private var isCancelled: Bool = false
    
    @State var imagePickerPresented = false
    
    var body: some View {
        ZStack {
            Color.theme.statusBar.ignoresSafeArea()
            
            Color.theme.background.ignoresSafeArea(edges: [.bottom])
                .padding(.top, 5)
            
            NavigationLink(
                destination: FirstPageView().navigationBarBackButtonHidden(true),
                isActive: $isCancelled,
                label: { EmptyView() }
            )
            
            VStack {
                // Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width - 250, height: 50)
                    .padding(.top, 23)
                
                HStack {
                    Button {
                        isCancelled.toggle()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 24))
                            .padding(.leading, 24)
                            .tint(Color.theme.accent)
                    }
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("Add profile picture")
                            .font(Font.custom("Poppins", size: 38))
                            .foregroundColor(Color.theme.accent)
                            .padding(.top, 34)
                            .padding(.leading, 24)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Choose a profile picture that represents you!")
                            .font(Font.custom("Poppins", size: 16))
                            .foregroundColor(Color.theme.accent)
                            .padding(.leading, 24)
                            .padding(.top, -6)
                        
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
                            .font(Font.custom("Poppins", size: 16))
                            .foregroundColor(Color.theme.accent)
                            .padding(.leading, 28)
                            .padding(.top, 18)
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 46) {
                        Button {
                            profileImage = Image("Group 77")
                            selectedImage = UIImage(named: "Group 77")
                        } label: {
                            Image("Group 77")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }

                        
                        Button {
                            profileImage = Image("Group 81")
                            selectedImage = UIImage(named: "Group 81")
                        } label: {
                            Image("Group 81")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            profileImage = Image("Group 79")
                            selectedImage = UIImage(named: "Group 79")
                        } label: {
                            Image("Group 79")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            profileImage = Image("Group 84")
                            selectedImage = UIImage(named: "Group 84")
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
                            selectedImage = UIImage(named: "Group 80")
                        } label: {
                            Image("Group 80")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            profileImage = Image("Group 82")
                            selectedImage = UIImage(named: "Group 82")
                        } label: {
                            Image("Group 82")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            profileImage = Image("Group 86")
                            selectedImage = UIImage(named: "Group 86")
                        } label: {
                            Image("Group 86")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            profileImage = Image("Group 87")
                            selectedImage = UIImage(named: "Group 87")
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
                    Button(action: {
                        authenticationViewModel.registerPartTwoWithoutImage(
                            username: username,
                            email: email
                        ) { _ in }
                    }) {
                        Text("Skip")
                            .font(Font.custom("Poppins", size: 18))
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
                            .padding(.leading, 28)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        authenticationViewModel.registerPartTwo(
                            profileImage: selectedImage!,
                            username: username,
                            email: email
                        ) { _ in }
                    }) {
                        Text("Next")
                            .font(Font.custom("Poppins", size: 18))
                            .foregroundColor(Color.theme.background)
                            .frame(width: 150, height: 50)
                            .background(selectedImage != nil ? Color.theme.accent : Color.theme.accent.opacity(0.5))
                            .cornerRadius(8)
                            .padding(.trailing, 28)
                    }
                }
                .padding(.bottom)
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
        @State private var email: String = "Marcus.arnett10@gmail.com"
        
        var body: some View {
            ThirdPageView(username: $username, email: $email)
        }
    }
    
    static var previews: some View {
        previewHandler()
    }
}
