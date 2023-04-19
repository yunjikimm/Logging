//
//  ContentEditor.swift
//  Logging
//
//  Created by yunjikim on 2023/02/06.
//

import Foundation
import UIKit

class ContentEditor: UIScrollView {
    
    // MARK: component
    let writeScrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    lazy var superStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buttonStackView, titleTextView, pathView, contentTextView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dismissButton, writeButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        stackView.layoutMargins = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        let textView = UITextView()
        textView.text = PLACEHOLDER.TITLE
        textView.textColor = UIColor.lightGray
        textView.font = .boldSystemFont(ofSize: 25)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.text = PLACEHOLDER.CONTENT
        textView.textColor = UIColor.lightGray
        textView.font = .systemFont(ofSize: 17)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
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
        setUpScrollView()
        setUpButtonStackView()
        setUpTextStackView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpView
    func setUpScrollView() {
        addSubview(writeScrollView)
        writeScrollView.addSubview(superStackView)
        
        NSLayoutConstraint.activate([
            writeScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            writeScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            writeScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            writeScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            superStackView.topAnchor.constraint(equalTo: writeScrollView.contentLayoutGuide.topAnchor),
            superStackView.leadingAnchor.constraint(equalTo: writeScrollView.contentLayoutGuide.leadingAnchor),
            superStackView.trailingAnchor.constraint(equalTo: writeScrollView.contentLayoutGuide.trailingAnchor),
            superStackView.bottomAnchor.constraint(equalTo: writeScrollView.contentLayoutGuide.bottomAnchor),
            superStackView.widthAnchor.constraint(equalTo: writeScrollView.widthAnchor),
//            superStackView.heightAnchor.constraint(equalTo: writeScrollView.heightAnchor),
        ])
    }
    
    func setUpButtonStackView() {
        superStackView.addArrangedSubview(buttonStackView)
        buttonStackView.addArrangedSubview(dismissButton)
        buttonStackView.addArrangedSubview(writeButton)
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: superStackView.topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: superStackView.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: superStackView.trailingAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: superStackView.widthAnchor),
        ])
    }
    
    func setUpTextStackView() {
        superStackView.addArrangedSubview(titleTextView)
        superStackView.addArrangedSubview(pathView)
        superStackView.addArrangedSubview(contentTextView)
        
        NSLayoutConstraint.activate([
            titleTextView.leadingAnchor.constraint(equalTo: superStackView.leadingAnchor),
            titleTextView.trailingAnchor.constraint(equalTo: superStackView.trailingAnchor),
            titleTextView.widthAnchor.constraint(equalTo: superStackView.widthAnchor),
            
            pathView.leadingAnchor.constraint(equalTo: superStackView.leadingAnchor),
            pathView.trailingAnchor.constraint(equalTo: superStackView.trailingAnchor),
            pathView.widthAnchor.constraint(equalTo: superStackView.widthAnchor),
            pathView.heightAnchor.constraint(equalToConstant: 1),
            
            contentTextView.leadingAnchor.constraint(equalTo: superStackView.leadingAnchor),
            contentTextView.trailingAnchor.constraint(equalTo: superStackView.trailingAnchor),
//            contentTextView.bottomAnchor.constraint(equalTo: superStackView.bottomAnchor),
            contentTextView.widthAnchor.constraint(equalTo: superStackView.widthAnchor),
        ])
    }
    
}
