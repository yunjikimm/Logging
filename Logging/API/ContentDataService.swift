//
//  ContentDataService.swift
//  Logging
//
//  Created by yunjikim on 2023/02/16.
//

import Foundation
import UIKit
import RealmSwift
import Alamofire

class ContentDataService {
    static let contentDataService = ContentDataService()
    let realm = try! Realm()
    
    // MARK: GET - All Content
    func getContent() -> Results<Content> {
        let contents = realm.objects(Content.self)
        let sortedContents = contents.sorted(byKeyPath: "updatedAt", ascending: false)
        
        return sortedContents
    }
    
    // MARK: POST - New Content
    func postContent(_ parameter: Content) {
        do {
            try realm.write {
                realm.add(parameter)
            }
        } catch let error as NSError {
            print("postContent() error: \(error)")
        }
    }
    
    // MARK: UPDATE - Modify Content
    func updateContent(_ parameter: Content) {
        do {
            try realm.write {
                realm.create(Content.self, value: parameter, update: .modified)
            }
        } catch let error as NSError {
            print("updateContent() error: \(error)")
        }
    }
    
    // MARK: DELETE - Delete Content
    func deleteContent(_ indexPath: Int) {
        let contents = realm.objects(Content.self)
        do {
            try realm.write {
                realm.delete(contents[indexPath])
            }
        } catch let error as NSError {
            print("deleteContent() error: \(error)")
        }
    }

}
