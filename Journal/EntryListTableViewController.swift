//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Andrew Porter on 2/4/16.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedInstance.entriesArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        let entry = EntryController.sharedInstance.entriesArray[indexPath.row]
        
        cell.textLabel?.text = entry.title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let entry = EntryController.sharedInstance.entriesArray[indexPath.row]
            print(EntryController.sharedInstance.entriesArray.count)
            EntryController.sharedInstance.deleteEntry(entry)
            print(EntryController.sharedInstance.entriesArray.count)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            //TODO: - Is this right?
            EntryController.sharedInstance.saveToPersistenceStorage(EntryController.sharedInstance.entriesArray)
        }
    }
    
    //MARK: - NAVIGATION
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if  segue.identifier == "toEntryDetailView" {
            
            if let detailViewController = segue.destinationViewController as? DetailViewController {
                
                let indexPath = tableView.indexPathForSelectedRow
                
                if let selectedRow = indexPath?.row {
                    let entry = EntryController.sharedInstance.entriesArray[selectedRow]
                    detailViewController.entry = entry
                }
            }
        }
    }
}
































