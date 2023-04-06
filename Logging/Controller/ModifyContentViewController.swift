//
//  ModifyContentViewController.swift
//  Logging
//
//  Created by yunjikim on 2023/02/13.
//

import Foundation
import UIKit

class ModifyContentViewController: UIViewController {
    
    let contentEditor: ContentEditor = {
        let view = ContentEditor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var modifiedContentList: Content! = nil
    
    // MARK: override
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextView()
        setUpView()
        self.hideKeyboardWhenTappedAround()
        contentEditor.dismissButton.addTarget(self, action: #selector(clickedDismissButton), for: .touchUpInside)
        contentEditor.writeButton.addTarget(self, action: #selector(clickedWriteButton), for: .touchUpInside)
    }
    
    // MARK: setUpTextView
    func setUpTextView() {
        contentEditor.titleTextView.delegate = self
        contentEditor.contentTextView.delegate = self
    }
    
    // MARK: setUpView
    func setUpView() {
        view.backgroundColor = .systemBackground
        view.addSubview(contentEditor)
        contentEditor.writeButton.setTitle("수정", for: .normal)
        
        NSLayoutConstraint.activate([
            contentEditor.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentEditor.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentEditor.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentEditor.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: clickedDismissButton - Cancel Write Post
    @objc func clickedDismissButton() {
        self.view.window?.rootViewController?.dismiss(animated: true)
    }
    
    // MARK: clickedWriteButton - Realm Post
    @objc func clickedWriteButton() {
        let date = Date()
        let parameter = Content(value: [
            "_id": modifiedContentList._id,
            "title": contentEditor.titleTextView.text!,
            "content": contentEditor.contentTextView.text!,
            "createdAt": modifiedContentList.createdAt!,
            "updatedAt": date
        ])
        ContentDataService().updateContent(parameter)
        self.view.window?.rootViewController?.dismiss(animated: true)
    }
    
}
