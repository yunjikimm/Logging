//
//  ContentEditor.swift
//  Logging
//
//  Created by yunjikim on 2023/02/06.
//

import Foundation
import UIKit

class ContentEditor: UIView {
    
    // MARK: component
    let writeScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let groupView: UIView = {
        let view = UIView()
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let writeButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let titleTextView: UITextView = {
        let view = UITextView()
        view.text = PLACEHOLDER.TITLE
        view.textColor = UIColor.lightGray
        view.font = .boldSystemFont(ofSize: 25)
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let contentTextView: UITextView = {
        let view = UITextView()
        view.text = PLACEHOLDER.CONTENT
        view.textColor = UIColor.lightGray
        view.font = .systemFont(ofSize: 17)
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let pathView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpView
    func setUpView() {
        addSubview(writeScrollView)
        writeScrollView.addSubview(groupView)
        groupView.addSubview(writeButton)
        groupView.addSubview(dismissButton)
        groupView.addSubview(titleTextView)
        groupView.addSubview(pathView)
        groupView.addSubview(contentTextView)
        
        NSLayoutConstraint.activate([
            writeScrollView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            writeScrollView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            writeScrollView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            writeScrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            groupView.topAnchor.constraint(equalTo: writeScrollView.topAnchor),
            groupView.leadingAnchor.constraint(equalTo: writeScrollView.leadingAnchor),
            groupView.trailingAnchor.constraint(equalTo: writeScrollView.trailingAnchor),
            groupView.widthAnchor.constraint(equalTo: writeScrollView.widthAnchor),
            groupView.heightAnchor.constraint(equalTo: writeScrollView.heightAnchor),
            
            dismissButton.topAnchor.constraint(equalTo: groupView.topAnchor, constant: 10),
            dismissButton.leadingAnchor.constraint(equalTo: groupView.leadingAnchor, constant: 7),
            
            writeButton.topAnchor.constraint(equalTo: groupView.topAnchor, constant: 10),
            writeButton.trailingAnchor.constraint(equalTo: groupView.trailingAnchor, constant: -7),
            
            titleTextView.topAnchor.constraint(equalTo: writeButton.bottomAnchor, constant: 10),
            titleTextView.leadingAnchor.constraint(equalTo: groupView.leadingAnchor, constant: 7),
            titleTextView.trailingAnchor.constraint(equalTo: groupView.trailingAnchor, constant: -7),
            
            pathView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 10),
            pathView.leadingAnchor.constraint(equalTo: groupView.leadingAnchor, constant: 7),
            pathView.trailingAnchor.constraint(equalTo: groupView.trailingAnchor, constant: -7),
            pathView.heightAnchor.constraint(equalToConstant: 1),
            
            contentTextView.topAnchor.constraint(equalTo: pathView.bottomAnchor, constant: 15),
            contentTextView.leadingAnchor.constraint(equalTo: groupView.leadingAnchor, constant: 7),
            contentTextView.trailingAnchor.constraint(equalTo: groupView.trailingAnchor, constant: -7),
        ])
    }
    
}
