//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Andrew Porter on 2/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    
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
    
    //MARK: - Button Actions
    @IBAction func saveButtonTapped(sender: UIButton) {
        
        if let title = self.titleTextField.text, body = self.bodyTextField.text {
            let entry = Entry(title: title, body: body, timestamp: NSDate())
            
            self.entry = entry
        }
        
        print(EntryController.sharedInstance.entriesArray.count)
        
        if let entry = self.entry {
            EntryController.sharedInstance.addEntry(entry)
        }
        
        print(EntryController.sharedInstance.entriesArray.count)
        
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func clearButtonTapped(sender: UIButton) {
        
        titleTextField.text = nil
        bodyTextField.text = nil
        
        if let _ = self.entry {
            self.entry = nil
        }
        
    }
    
    //MARK: - Functions
    func updateWithEntry(entry: Entry) {
        titleTextField.text = entry.title
        bodyTextField.text = entry.body
    }
    
    //MARK: - Delegate methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}




















