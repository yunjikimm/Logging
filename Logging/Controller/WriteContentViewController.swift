//
//  WriteContentViewController.swift
//  Logging
//
//  Created by yunjikim on 2023/02/06.
//

import Foundation
import UIKit
import RealmSwift

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
        setUpKeyboardButton()
        contentEditor.dismissButton.addTarget(self, action: #selector(clickedDismissButton), for: .touchUpInside)
        contentEditor.writeButton.addTarget(self, action: #selector(clickedWriteButton), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentEditor.titleTextView.text = PLACEHOLDER.TITLE
        contentEditor.contentTextView.text = PLACEHOLDER.CONTENT
        contentEditor.titleTextView.textColor = .placeholderText
        contentEditor.contentTextView.textColor = .placeholderText
        print("작성: \(contentEditor.writeScrollView.contentInset)")
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
        let writedTitleText = contentEditor.titleTextView.text!
        let writedContentText = contentEditor.contentTextView.text!
        
        if writedTitleText == PLACEHOLDER.TITLE {
            alertNilText("제목")
        } else if writedTitleText == "" {
            alertNilText("제목")
        } else if writedContentText == PLACEHOLDER.CONTENT {
            alertNilText("내용")
        } else if writedContentText == "" {
            alertNilText("내용")
        } else {
            let createdContentObject = Content(
                _id: UUID(),
                title: contentEditor.titleTextView.text!,
                content: contentEditor.contentTextView.text!,
                createdAt: date,
                updatedAt: date
            )
            ContentDataService().createContent(createdContentObject)
            self.view.window?.rootViewController?.dismiss(animated: true)
        }
    }
    
}
