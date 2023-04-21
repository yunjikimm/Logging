//
//  ContentEditorExtension.swift
//  Logging
//
//  Created by yunjikim on 2023/02/13.
//

import Foundation
import UIKit

extension WriteContentViewController: UITextViewDelegate, UITextFieldDelegate {
    
    // MARK: extension - textView focus placeholder
    // textView focus
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == PLACEHOLDER.TITLE || textView.text == PLACEHOLDER.CONTENT {
            textView.text = nil
            textView.textColor = .label
        }
    }
    // textView focus end
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = .placeholderText
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
            limitedLength = 100
        } else {
            limitedLength = 1000
        }
        
        return newLength < limitedLength
    }
    
    // MARK: extension - textViewDidChange
    func textViewDidChange(_ textView: UITextView) {
        let title = contentEditor.titleTextView
        let content = contentEditor.contentTextView
        
        guard let changedTextView = title.text else { return }
        if changedTextView.contains("\n") {
            let trimText = changedTextView.trimmingCharacters(in: .newlines)
            title.text = trimText
            content.becomeFirstResponder()
            content.selectedTextRange = content.textRange(from: content.endOfDocument, to: content.endOfDocument)
        }
    }
    
    // MARK: extension - setUpKeyboardButton
    func setUpKeyboardButton() {
        let toolbar = UIToolbar()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(endEditingToKeyboard))
        let flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.sizeToFit()
        toolbar.setItems([flexibleSpaceButton, doneBtn], animated: false)
        
        contentEditor.titleTextView.inputAccessoryView = toolbar
        contentEditor.contentTextView.inputAccessoryView = toolbar
    }
    @objc func endEditingToKeyboard() {
        contentEditor.titleTextView.resignFirstResponder()
        contentEditor.contentTextView.resignFirstResponder()
    }
    
    // MARK: extension - keyboardWillShow,keyboardWillHide
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo as NSDictionary?,
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                  return
              }
        contentEditor.writeScrollView.contentInset.bottom = (keyboardFrame.size.height - view.safeAreaInsets.bottom)
    }
    @objc func keyboardWillHide(_ notification: Notification) {
        contentEditor.writeScrollView.contentInset.bottom = 0.0
    }
    
    // MARK: alertNilText
    func alertNilText(_ alertText: String) {
        let alert = UIAlertController(title: "알림", message: alertText+"을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }
    
}

extension ModifyContentViewController: UITextViewDelegate, UITextFieldDelegate {
    
    // MARK: extension - textView focus placeholder
    // textView focus
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == PLACEHOLDER.TITLE || textView.text == PLACEHOLDER.CONTENT {
            textView.text = nil
            textView.textColor = .label
        }
    }
    // textView focus end
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = .placeholderText
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
            limitedLength = 100
        } else {
            limitedLength = 1000
        }
        
        return newLength < limitedLength
    }
    
    // MARK: extension - textViewDidChange
    func textViewDidChange(_ textView: UITextView) {
        let title = contentEditor.titleTextView
        let content = contentEditor.contentTextView
        
        guard let changedTextView = title.text else { return }
        if changedTextView.contains("\n") {
            let trimText = changedTextView.trimmingCharacters(in: .newlines)
            title.text = trimText
            content.becomeFirstResponder()
            content.selectedTextRange = content.textRange(from: content.endOfDocument, to: content.endOfDocument)
        }
    }
    
    // MARK: extension - setUpKeyboardButton
    func setUpKeyboardButton() {
        let toolbar = UIToolbar()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(endEditingToKeyboard))
        let flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.sizeToFit()
        toolbar.setItems([flexibleSpaceButton, doneBtn], animated: false)
        
        contentEditor.titleTextView.inputAccessoryView = toolbar
        contentEditor.contentTextView.inputAccessoryView = toolbar
    }
    @objc func endEditingToKeyboard() {
        contentEditor.titleTextView.resignFirstResponder()
        contentEditor.contentTextView.resignFirstResponder()
    }
    
    // MARK: extension - keyboardWillShow,keyboardWillHide
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo as NSDictionary?,
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                  return
              }
        contentEditor.writeScrollView.contentInset.bottom = (keyboardFrame.size.height - view.safeAreaInsets.bottom)
    }
    @objc func keyboardWillHide(_ notification: Notification) {
        contentEditor.writeScrollView.contentInset.bottom = 0.0
    }
    
    // MARK: alertNilText
    func alertNilText(_ alertText: String) {
        let alert = UIAlertController(title: "알림", message: alertText+"을 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }
    
}
