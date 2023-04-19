//
//  ModifyContentViewController.swift
//  Logging
//
//  Created by yunjikim on 2023/02/13.
//

import Foundation
import UIKit
import RealmSwift

class ModifyContentViewController: UIViewController {
    
    let contentEditor: ContentEditor = {
        let view = ContentEditor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var contentList: Content! = nil
    
    // MARK: override
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextView()
        setUpView()
        setUpKeyboardButton()
        contentEditor.dismissButton.addTarget(self, action: #selector(clickedDismissButton), for: .touchUpInside)
        contentEditor.writeButton.addTarget(self, action: #selector(clickedWriteButton), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentEditor.titleTextView.text = contentList.title
        contentEditor.contentTextView.text = contentList.content
        contentEditor.titleTextView.textColor = .black
        contentEditor.contentTextView.textColor = .black
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
        let newDate = Date()
        let modifiedTitleText = contentEditor.titleTextView.text!
        let modifiedContentText = contentEditor.contentTextView.text!
        
        if modifiedTitleText == PLACEHOLDER.TITLE {
            alertNilText("제목")
        } else if modifiedContentText == PLACEHOLDER.CONTENT {
            alertNilText("내용")
        } else {
            let modifiedContentObject = Content(
                _id: contentList._id,
                title: contentEditor.titleTextView.text!,
                content: contentEditor.contentTextView.text!,
                createdAt: contentList.createdAt!,
                updatedAt: newDate
            )
            ContentDataService().updateContent(modifiedContentObject)
            self.view.window?.rootViewController?.dismiss(animated: true)
        }        
    }
    
}
