//
//  EntryController.swift
//  Journal
//
//  Created by Andrew Porter on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation


class EntryController {
    
    private let entriesKey = "entries"
    
    //Add entries Array property, set it to empty in the initializer
    // TODO: is our singleton correct?
    static let sharedController = EntryController()
    
    // Create empty entries array
    var entriesArray = [(Entry(title: "Hello", bodyText: "Hi"))]
    
    // Add entry function
    func addEntry(entry: Entry) -> () {
        entriesArray.append(entry)
    }
    
    //Remove entry function
    func removeEntry(specificEntry: Entry) -> () {
        let index = self.entriesArray.indexOf(specificEntry)
        
        // This finds a index and then removes the entry at that index.
        if let entryIndex = index {
            self.entriesArray.removeAtIndex(entryIndex)
        }
    }
    
    //NSUserdefaults methods
    func saveToPersistentStorage() {
        let entryDictionaries = self.entriesArray.map({$0.dictionaryCopy()})
        NSUserDefaults.standardUserDefaults().setValue(entryDictionaries, forKey: entriesKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    
    
}