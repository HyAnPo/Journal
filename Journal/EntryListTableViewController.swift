//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Andrew Porter on 10/26/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return EntryController.sharedController.entries.count
    }
    
    // MARK: Study
    // Had to reference master
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        let entry = EntryController.sharedController.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        
        return cell
    }
    
    // MARK: Study
    // This allows you to delete an entry
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let entry = EntryController.sharedController.entries[indexPath.row]
            
            EntryController.sharedController.removeEntry(entry)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toShowEntry" {
            
            if let detailViewController = segue.destinationViewController as? EntryDetailViewController {
                
                _ = detailViewController.view
                
                let indexPath = tableView.indexPathForSelectedRow
                
                if let selectedRow = indexPath?.row {
                    let entry = EntryController.sharedController.entries[selectedRow]
                    detailViewController.updateWithEntry(entry)
                }
            }
        }
    }
}
