//
//  Content.swift
//  Logging
//
//  Created by yunjikim on 2023/01/25.
//

import Foundation
import RealmSwift

class Content: Object, Codable {
    @Persisted(primaryKey: true) var _id: UUID
    @Persisted var title: String?
    @Persisted var content: String?
    @Persisted var createdAt: Date?
    @Persisted var updatedAt: Date?
    
    convenience init(_id: UUID, title: String, content: String, createdAt: Date, updatedAt: Date) {
        self.init()
        self._id = _id
        self.title = title
        self.content = content
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
