//
//  ModifyContentViewController.swift
//  Logging
//
//  Created by yunjikim on 2023/02/13.
//

import Foundation
import UIKit

class ModifyContentViewController: WriteContentViewController {
    
    // MARK: override
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextColor()
    }
    
    // MARK: setUpTextColor
    func setUpTextColor() {
        contentEditor.titleTextView.textColor = .black
        contentEditor.contentTextView.textColor = .black
    }
    
}
