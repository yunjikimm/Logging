//
//  ContentModel.swift
//  Logging
//
//  Created by yunjikim on 2023/01/25.
//

import Foundation
import UIKit

struct Content: Codable {
    let id: UUID!
    var title: String?
    var content: String?
    var createdAt: Date
    var updateAt: Date?
}
