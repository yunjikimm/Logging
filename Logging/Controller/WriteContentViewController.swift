//
//  WriteContentViewController.swift
//  Logging
//
//  Created by yunjikim on 2023/02/06.
//

import Foundation
import UIKit

class WriteContentViewController: UIViewController {
    
    let contentEditor: ContentEditor = {
        let view = ContentEditor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: override
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpTextView()
        self.hideKeyboardWhenTappedAround()
        contentEditor.dismissButton.addTarget(self, action: #selector(clickedDismissButton), for: .touchUpInside)
        contentEditor.writeButton.addTarget(self, action: #selector(clickedWriteButton), for: .touchUpInside)
    }
    
    // MARK: setUpView
    func setUpView() {
        view.backgroundColor = .systemBackground
        view.addSubview(contentEditor)
        contentEditor.writeButton.setTitle("등록", for: .normal)
        
        NSLayoutConstraint.activate([
            contentEditor.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentEditor.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentEditor.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentEditor.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: setUpTextView
    func setUpTextView() {
        contentEditor.titleTextView.delegate = self
        contentEditor.contentTextView.delegate = self
    }
    
    // MARK: clickedDismissButton - Cancel Write Post
    @objc func clickedDismissButton() {
        self.view.window?.rootViewController?.dismiss(animated: true)
    }
    
    // MARK: clickedWriteButton - Realm Post
    @objc func clickedWriteButton() {
        let date = Date()
        var parameter: Content
        
        if contentEditor.titleTextView.text!.contains(PLACEHOLDER.TITLE) {
            alertNilText("제목")
        } else if contentEditor.contentTextView.text!.contains(PLACEHOLDER.CONTENT) {
            alertNilText("내용")
        } else {
            parameter = Content(value: [
                "_id": UUID(),
                "title": contentEditor.titleTextView.text!,
                "content": contentEditor.contentTextView.text!,
                "createdAt": date,
                "updatedAt": date
            ])
            ContentDataService().postContent(parameter)
            self.view.window?.rootViewController?.dismiss(animated: true)
        }
    }
    
}
