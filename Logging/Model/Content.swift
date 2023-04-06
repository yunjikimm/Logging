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
    
    convenience init(title: String, content: String) {
        self.init()
        self.title = title
        self.content = content
    }
}
