//
//  ImagePicker.swift
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

struct ImagePicker: UIViewControllerRepresentable {
  // image represents the current picked UIImage
  @Binding var image: UIImage?
  // For dismissing the ImagePicker view
  @Environment(\.presentationMode) var mode
  // Function Name: makeUIViewController
  // Parameters: context: Context
  // Output: some UIViewController
  // Returns the UIImagePickerController in the current context
  func makeUIViewController(context: Context) -> some UIViewController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    return picker
  }
  // Function Name: makeCoordinator
  // Returns its own Coordinator
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  // Function Name: updateUIViewController
  // Parameters: uiViewController: UIViewControllerType, context: Context
  // Does nothing, here to conform with UIViewControllerRepresentable type
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
  // Coordinator Class
  // Subset: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate
  // parent: ImagePicker type that represents the upper ImagePicker structure
  // Function Name: init
  //   Parameters: parent: ImagePicker
  // Function Name: imagePickerController
  //   Parameters: picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
  //   Returns the image once one is selected, and then dismisses the ImagePicker
  class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let parent: ImagePicker
    init(_ parent: ImagePicker) {
      self.parent = parent
    }
    func imagePickerController(
      _ picker: UIImagePickerController,
      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
      guard let image = info[.originalImage] as? UIImage else { return }
      self.parent.image = image
      self.parent.mode.wrappedValue.dismiss()
    }
  }
}
