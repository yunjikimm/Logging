//
//  NetworkResult.swift
//  Logging
//
//  Created by yunjikim on 2023/02/20.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestError(T)
    case pathError
    case serverError
    case networkFail
}
