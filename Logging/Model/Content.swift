//
//  Content.swift
//  Logging
//
//  Created by yunjikim on 2023/01/25.
//

import Foundation

struct Root: Codable {
    var contentsData: [Content]
    
    enum CodingKeys:String, CodingKey {
        case contentsData = "contentsData"
    }
}

struct Content: Codable {
    var id: String = UUID().uuidString
    var title: String
    var content: String
    var createdAt: String
    var updatedAt: String
    
    init(id: String, title: String, content: String, createdAt: String, updatedAt: String) {
        self.id = id
        self.title = title
        self.content = content
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    enum CodingKeys:String, CodingKey {
        case id = "id"
        case title = "title"
        case content = "content"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }
}
