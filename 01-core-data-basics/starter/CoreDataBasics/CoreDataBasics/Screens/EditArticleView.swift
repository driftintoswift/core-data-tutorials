//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//

import SwiftUI

struct EditArticleView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var article: Article
    @State private var selectedImage: UIImage?
    
    var image: UIImage {
        if selectedImage != nil {
            return selectedImage!
        } else {
            return UIImage(named: "placeholder")!
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {
            ImagePickerContainerView(image: $selectedImage) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            .frame(maxWidth: .infinity, maxHeight: 280)
            
            VStack(alignment: .leading) {
                Text("Title")
                TextField("", text: $article.title)
                    .modifier(TextfieldModifier())
            }
            
            VStack(alignment: .leading) {
                Text("Content")
                TextEditor(text: $article.content)
                    .modifier(TextfieldModifier())
            }
            
            HStack {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(.bordered)
                Button("Save") {
                    presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .onAppear {
            if article.imageUrl != nil {
                selectedImage = UIImage(named: article.imageUrl!)
            }
        }
    }
    
}
