//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Caleb Hicks on 9/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var entryTitleCell: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedController.entriesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EntryCell", forIndexPath: indexPath)
        let entry = EntryController.sharedController.entriesArray[indexPath.row]
        entryTitleCell.textLabel?.text = entry.title
        
        return cell
    }

}

