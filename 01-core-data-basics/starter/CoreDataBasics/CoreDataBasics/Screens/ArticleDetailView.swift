//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//

import SwiftUI

struct ArticleDetailView: View {
    
    @State var article: Article
    @State private var isShowingEditModal: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(article.imageUrl ?? "placeholder")
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
            EditArticleView(article: article)
        }
    }
    
}
