//
//  ContentDataService.swift
//  Logging
//
//  Created by yunjikim on 2023/02/16.
//

import Foundation
import UIKit
import Alamofire

class ContentDataService {
    static let contentDataService = ContentDataService()
    
    func getAllContent(completionHandler: @escaping (Result<Root, Error>) -> Void) {
        AF.request(API.URL,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: ["Content-Type": "application/json"])
            .validate(statusCode: 200..<500)
            .responseDecodable(of: Root.self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(.success(data))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
        }
    }
    
}
