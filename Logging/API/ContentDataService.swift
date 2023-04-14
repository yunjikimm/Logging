//
//  ContentDataService.swift
//  Logging
//
//  Created by yunjikim on 2023/02/16.
//

import Foundation
import UIKit
import RealmSwift

class ContentDataService {
    static let shared = ContentDataService()
    let realm = try! Realm()
    
    // MARK: CREATE - New Content
    func createContent<T: Content>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch let error as NSError {
            print("postContent() error: \(error)")
        }
    }
    
    // MARK: UPDATE - Modify Content
    func updateContent<T: Content>(_ object: T) {
        guard let selected = realm.object(ofType: Content.self, forPrimaryKey: object._id) else {
            print("not found")
            return
        }
        do {
            try realm.write {
                selected.title = object.title
                selected.content = object.content
                selected.updatedAt = object.updatedAt
            }
        } catch let error as NSError {
            print("updateContent() error: \(error)")
        }
    }
    
    // MARK: DELETE - Delete Content
    func deleteContent<T: Content>(_ Object: T) {
        do {
            try realm.write {
                realm.delete(Object)
            }
        } catch let error as NSError {
            print("deleteContent() error: \(error)")
        }
    }

}
