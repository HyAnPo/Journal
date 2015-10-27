//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Andrew Porter on 10/26/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func clearButtonTapped(sender: UIButton) {
        
        // MARK: - Question
        //What is the difference between setting to nil as opposed to an empty String?
        titleTextField.text = nil
        bodyTextField.text = nil
    }
    
    
    
    
    
    // MARK: - Study
    // Still don't fully understand the role of the Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
