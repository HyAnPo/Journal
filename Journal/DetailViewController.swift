//
//  DetailViewController.swift
//  Journal
//
//  Created by Andrew Porter on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    //MARK: - Variables
    var entry: Entry?
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(sender: UIButton) {
        
        if let entry = self.entry {
            entry.title = self.titleTextField.text!
            entry.body = self.bodyTextView.text!
            entry.timestamp = NSDate()
        } else {
            
            if let title = titleTextField.text, body = bodyTextView.text {
                let newEntry = Entry(timestamp: NSDate(), title: title, body: body)
                EntryController.sharedInstance.addEntry(newEntry)
                self.entry = newEntry
            }
        }
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func clearButtonTapped(sender: UIButton) {
        titleTextField.text = nil
        bodyTextView.text = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Delegate functions
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Functions
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }
    
}
