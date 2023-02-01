//
//  Content.swift
//  Logging
//
//  Created by yunjikim on 2023/01/25.
//

import Foundation
import UIKit

struct Content: Hashable {
    let id: UUID = UUID()
    var title: String?
    var content: String?
    var createdAt: Date!
//    var updateAt: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
