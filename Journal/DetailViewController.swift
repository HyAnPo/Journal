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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entry = self.entry {
            updateWithEntry(entry)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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
                
                //TODO: - Is this right?
                EntryController.sharedInstance.saveToPersistenceStorage(EntryController.sharedInstance.entriesArray)
            }
        }
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func clearButtonTapped(sender: UIButton) {
        titleTextField.text = nil
        bodyTextView.text = nil
    }
    
    //MARK: - Delegate functions
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Functions
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.body
    }
    
}
