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
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var superStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [buttonStackView, titleTextView, pathView, contentTextView])
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var buttonStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dismissButton, writeButton])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 0
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
        ])
    }
    
    func setUpButtonStackView() {
        superStackView.addSubview(buttonStackView)
        buttonStackView.addSubview(dismissButton)
        buttonStackView.addSubview(writeButton)
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: superStackView.topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: superStackView.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: superStackView.trailingAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: superStackView.widthAnchor),
        ])
    }
    
    func setUpTextStackView() {
        superStackView.addSubview(titleTextView)
        superStackView.addSubview(pathView)
        superStackView.addSubview(contentTextView)
        
        NSLayoutConstraint.activate([
            titleTextView.widthAnchor.constraint(equalTo: superStackView.widthAnchor),
            titleTextView.leadingAnchor.constraint(equalTo: superStackView.leadingAnchor),
            titleTextView.trailingAnchor.constraint(equalTo: superStackView.trailingAnchor),
            
            pathView.widthAnchor.constraint(equalTo: superStackView.widthAnchor),
            pathView.leadingAnchor.constraint(equalTo: superStackView.leadingAnchor),
            pathView.trailingAnchor.constraint(equalTo: superStackView.trailingAnchor),
            pathView.heightAnchor.constraint(equalToConstant: 1),
            
            contentTextView.widthAnchor.constraint(equalTo: superStackView.widthAnchor),
            contentTextView.leadingAnchor.constraint(equalTo: superStackView.leadingAnchor),
            contentTextView.trailingAnchor.constraint(equalTo: superStackView.trailingAnchor),
        ])
    }
    
}
