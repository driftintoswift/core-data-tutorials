//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//

import SwiftUI

struct ArticlesView: View {
    
    // MARK: Static data
    let articles = [
        Article(title: "Downloading with Combine", content: "Combine is truly awesome framework and in this article we will go through every possible way of downloading data with it. We will use all kinds of publishers. We will filter data and handle errors in Combine way.", imageUrl: "1", createdAt: Date()),
        Article(title: "Downloading with Combine", content: "Combine is truly awesome framework and in this article we will go through every possible way of downloading data with it. We will use all kinds of publishers. We will filter data and handle errors in Combine way.", imageUrl: "2", createdAt: Date()),
        Article(title: "Downloading with Combine", content: "Combine is truly awesome framework and in this article we will go through every possible way of downloading data with it. We will use all kinds of publishers. We will filter data and handle errors in Combine way.", imageUrl: "3", createdAt: Date()),
    ]
    
    @State private var isShowingAddModal: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        ArticleCardView(article: article)
                            .padding(.vertical)
                    }
                    .buttonStyle(.plain)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Articles")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        isShowingAddModal.toggle()
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $isShowingAddModal) {
            EditArticleView(
                article: Article(
                    title: "",
                    content: "",
                    createdAt: Date()
                )
            )
        }
    }
    
}
