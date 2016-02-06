//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Andrew Porter on 2/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        tableView.reloadData()
    }

    // MARK: - TableView Data Source methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedInstance.entriesArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        let entry = EntryController.sharedInstance.entriesArray[indexPath.row]
        
        cell.textLabel?.text = entry.title
        
        return cell
    }
    
    // MARK: - TableView Delegate methods
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let entry = EntryController.sharedInstance.entriesArray[indexPath.row]
            
            EntryController.sharedInstance.deleteEntry(entry)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toDetailView" {
            
            if let destinationViewController = segue.destinationViewController as? EntryDetailViewController {
                if let indexOfCell = tableView.indexPathForSelectedRow?.row {
                    let entryForCell = EntryController.sharedInstance.entriesArray[indexOfCell]
                    
                    destinationViewController.entry = entryForCell
                    
                }
            }
            
            
        }
    }
}

























