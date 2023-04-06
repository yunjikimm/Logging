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
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.text = PLACEHOLDER.TITLE
        view.textColor = UIColor.lightGray
        view.font = .boldSystemFont(ofSize: 25)
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let contentTextView: UITextView = {
        let view = UITextView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.text = PLACEHOLDER.CONTENT
        view.textColor = UIColor.lightGray
        view.font = .systemFont(ofSize: 17)
        view.isScrollEnabled = false
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
        writeScrollView.addSubview(titleTextView)
        writeScrollView.addSubview(contentTextView)
        writeScrollView.addSubview(writeButton)
        writeScrollView.addSubview(dismissButton)
        
        NSLayoutConstraint.activate([
            writeScrollView.topAnchor.constraint(equalTo: topAnchor),
            writeScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            writeScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            writeScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            dismissButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dismissButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            writeButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            writeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            titleTextView.topAnchor.constraint(equalTo: writeButton.bottomAnchor, constant: 10),
            titleTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            contentTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 20),
            contentTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            contentTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ])
    }
    
}
