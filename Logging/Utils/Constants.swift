//
//  Constants.swift
//  Logging
//
//  Created by yunjikim on 2023/02/06.
//

import Foundation
import UIKit
import RealmSwift

// MARK: ViewController
enum VIEWCONTROLLER {
    static let HOME = HomeViewController()
    static let WRITE = WriteContentViewController()
    static let MODIFY = ModifyContentViewController()
}

// MARK: textview placeholder
enum PLACEHOLDER {
    static let TITLE = "제목을 입력해주세요."
    static let CONTENT = "내용을 입력해주세요."
}

// MARK: empty label
enum EMPTYTABLE {
    static let EMPTY = "아직 글이 없습니다.\n지금 바로 새로운 로그를 남겨보세요!"
}

// MARK: content model name
enum CONTENTMODEL {
    static let ID = "id"
    static let TITLE = "title"
    static let CONTENT = "content"
    static let CREATEDAT = "createdAt"
    static let UPDATEDAT = "updatedAt"
}

enum URL {
    static let REALMDB = Realm.Configuration.defaultConfiguration.fileURL
}
