//
//  Articles.swift
//  RealWorldApp
//
//  Created by Franklin Velásquez on 2/08/23.
//

import Foundation

struct Article: Codable, Identifiable {
    
    var id: String {
        slug
    }
    
    let slug: String
    let title, description, body: String
    let tagList: [String]
    let createdAt, updatedAt: String
    let favorited: Bool
    let favoritesCount: Int
    let author: Author
}

struct Author: Codable {
    let username: String
    let bio: String?
    let image: String
    let following: Bool
}

struct ArticleResponse: Codable {
    let article: Article
}

struct MultipleArticlesResponse: Codable {
    let articles: [Article]
    let articlesCount: Int?
}
