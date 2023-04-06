//
//  ContentModel.swift
//  Logging
//
//  Created by yunjikim on 2023/03/10.
//

import Foundation

struct ContentModel: Codable {
    var id: String?
    var title: String?
    var content: String?
    var createdAt: Date?
    var updatedAt: Date?
}
