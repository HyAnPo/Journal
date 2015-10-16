//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Andrew Porter on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var entryTitle: UITextField!
    @IBOutlet weak var bodyText: UITextView!
    
    // TODO: What are we doing wrong!!!!
    func updateWithEntry(entry: Entry) {
        //self.entry
        
        self.entryTitle.text = entry.title
        self.bodyText.text = entry.bodyText
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
