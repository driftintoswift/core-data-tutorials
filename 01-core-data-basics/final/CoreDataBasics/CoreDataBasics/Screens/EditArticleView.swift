//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//

import CoreData
import SwiftUI

struct EditArticleView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    
    let article: Article?
    @State private var articleTitle: String = ""
    @State private var articleContent: String = ""
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
                TextField("", text: $articleTitle)
                    .modifier(TextfieldModifier())
            }

            VStack(alignment: .leading) {
                Text("Content")
                TextEditor(text: $articleContent)
                    .modifier(TextfieldModifier())
            }

            HStack {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(.bordered)
                Button("Save") {
                    if article == nil {
                        createArticle()
                    } else {
                        updateArticle()
                    }
                    do {
                        try moc.save()
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("Error saving context. Error: \(error)")
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .onAppear {
            if article != nil {
                articleTitle = article!.title
                articleContent = article!.content
                if article?.image != nil {
                    selectedImage = UIImage(data: article!.image!) ?? nil
                }
            }
        }
    }
    
    private func createArticle() {
        let article = Article(context: moc)
        article.id = UUID()
        article.title = articleTitle
        article.content = articleContent
        article.image = selectedImage?.jpegData(compressionQuality: 0.5)
        article.createdAt = Date()
    }
    
    private func updateArticle() {
        self.article?.title = articleTitle
        self.article?.content = articleContent
        self.article?.image = selectedImage?.jpegData(compressionQuality: 0.5)
    }
    
}
