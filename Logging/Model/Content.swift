//
//  Content.swift
//  Logging
//
//  Created by yunjikim on 2023/01/25.
//

import Foundation
import UIKit
import Alamofire

struct Content: Codable {
    var id: UUID = UUID()
    var title: String!
    var content: String!
    var createdAt: Date!
    var updatedAt: Date!
}
