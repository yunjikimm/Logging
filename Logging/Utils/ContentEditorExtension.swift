//
//  ContentEditorExtension.swift
//  Logging
//
//  Created by yunjikim on 2023/02/13.
//

import Foundation
import UIKit

extension WriteContentViewController: UITextViewDelegate {
    
    // MARK: extension - textView focus placeholder
    // textView focus
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == PLACEHOLDER.TITLE || textView.text == PLACEHOLDER.CONTENT {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }

    // textView focus end
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = UIColor.lightGray
            if textView == contentEditor.titleTextView {
                textView.text = PLACEHOLDER.TITLE
            } else if textView == contentEditor.contentTextView {
                textView.text = PLACEHOLDER.CONTENT
            }
        }
    }
    
    // MARK: extension - limit textView length
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let stringText = textView.text else { return true }
        let newLength = stringText.count + text.count - range.length
        
        var limitedLength: Int
        if textView == contentEditor.titleTextView {
            limitedLength = 60
        } else {
            limitedLength = 1000
        }
        
        return newLength < limitedLength
    }
    
    // MARK: extension - hide keyboard when tapped around
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contentEditor.titleTextView.text = PLACEHOLDER.TITLE
        contentEditor.contentTextView.text = PLACEHOLDER.CONTENT
        
        contentEditor.titleTextView.textColor = UIColor.lightGray
        contentEditor.contentTextView.textColor = UIColor.lightGray
    }
    
    func alertNilText(_ alertText: String) {
        let alert = UIAlertController(title: "알림", message: alertText+"을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }
    
}

extension ModifyContentViewController: UITextViewDelegate {
    
    // textView focus end
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = UIColor.lightGray
            if textView == contentEditor.titleTextView {
                textView.text = PLACEHOLDER.TITLE
            } else if textView == contentEditor.contentTextView {
                textView.text = PLACEHOLDER.CONTENT
            }
        }
    }
    
    // MARK: extension - limit textView length
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let stringText = textView.text else { return true }
        let newLength = stringText.count + text.count - range.length
        
        var limitedLength: Int
        if textView == contentEditor.titleTextView {
            limitedLength = 60
        } else {
            limitedLength = 1000
        }
        
        return newLength < limitedLength
    }
    
    // MARK: extension - hide keyboard when tapped around
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        contentEditor.titleTextView.text = contentList.title
        contentEditor.contentTextView.text = contentList.content
        contentEditor.titleTextView.textColor = .black
        contentEditor.contentTextView.textColor = .black
    }
    
}
