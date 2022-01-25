//
//  ArticleDetailView.swift
//  CoreDataBasics
//
//  Created by Karel Bušta on 21.01.2022.
//

import SwiftUI

struct ArticleCardView: View {
    
    let article: Article
    var image: UIImage
    
    
    init(article: Article) {
        self.article = article
        self.image = UIImage(named: "placeholder")!
        guard let imageFromData = UIImage(data: article.image!) else {
            return
        }
        image = imageFromData
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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
                .foregroundColor(Color("Shade75"))
                .lineLimit(3)
        }
    }
    
}
