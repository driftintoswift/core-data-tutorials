//
// Copyright (c) 2022 and Confidential to DriftIntoSwift.com. All rights reserved.
//

import CoreData
import SwiftUI

struct ArticlesView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.createdAt, order: .reverse)],
        predicate: NSPredicate(format: "%@ IN title", "Swift")
    )
    var articles: FetchedResults<Article>
    
    @State private var isShowingAddModal: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles, id: \.self) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        ArticleCardView(article: article)
                            .padding(.vertical)
                    }
                    .buttonStyle(.plain)
                }
                .onDelete(perform: removeArticles)
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
                article: nil
            )
        }
    }
    
    private func removeArticles(indexSet: IndexSet) {
        for index in indexSet {
            moc.delete(articles[index])
        }
        do {
            try moc.save()
        } catch {
            print("Error saving context. Error: \(error)")
        }
    }
    
}
