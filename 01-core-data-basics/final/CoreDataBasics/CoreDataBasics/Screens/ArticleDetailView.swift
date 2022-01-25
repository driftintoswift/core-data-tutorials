//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//

import SwiftUI

struct ArticleDetailView: View {
    
    let article: Article
    var image: UIImage
    @State private var isShowingEditModal: Bool = false
    
    init(article: Article) {
        self.article = article
        self.image = UIImage(named: "placeholder")!
        guard let imageFromData = UIImage(data: article.image!) else {
            return
        }
        image = imageFromData
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 320)
                
                HStack {
                    Text(article.title)
                    Spacer()
                    Text(article.createdAt.pretty())
                }
                .font(.headline)
                
                Text(article.content)
            }
            .padding()
        }
        .navigationTitle("Article")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") {
                    isShowingEditModal.toggle()
                }
            }
        }
        .sheet(isPresented: $isShowingEditModal) {
            EditArticleView(
                article: article
            )
        }
    }
    
}
