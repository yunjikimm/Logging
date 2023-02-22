//
//  Constants.swift
//  Logging
//
//  Created by yunjikim on 2023/02/06.
//

import Foundation
import UIKit

// MARK: ViewController
enum VIEWCONTROLLER {
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

// MARK: API
enum API {
    static let URL: String = "https://d427a9ed-180b-4e96-a309-3ff04fa81ba7.mock.pstmn.io/contents"
}
