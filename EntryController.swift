//
//  EntryController.swift
//  Journal
//
//  Created by Andrew Porter on 2/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedInstance = EntryController()
    
    var entriesArray: [Entry] = []
    
    
    //Create
    func addEntry(entry: Entry) {
        entriesArray.append(entry)
    }
    
    //Update
    func updateEntry(entry: Entry) {
        
    }
    
    //Delete
    func deleteEntry(entry: Entry) {
        
        let indexOfEntry = entriesArray.indexOf(entry)
        
        if let index = indexOfEntry {
            entriesArray.removeAtIndex(index)
        }
    }
}