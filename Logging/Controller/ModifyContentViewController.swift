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
        setUpView()
        setPlaceHolderTitle()
        self.hideKeyboardWhenTappedAround()
    }
    
}
