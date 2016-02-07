//
//  EntryController.swift
//  Journal
//
//  Created by Andrew Porter on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    private let kEntriesKey = "entries"
    
    static let sharedInstance = EntryController()
    
    var entriesArray: [Entry]
    
    init() {
        
        self.entriesArray = []
        
        self.loadfromPersistenceStorage()
    }
    
    func addEntry(entry: Entry) {
        entriesArray.append(entry)
    }
    
    func deleteEntry(entry: Entry) {
        
        if let entryIndex = entriesArray.indexOf(entry) {
            entriesArray.removeAtIndex(entryIndex)
            
        }
    }
    
    func saveToPersistenceStorage(entriesArray: [Entry]) {
        
        // create a dictionaryCopy for each entry in the array
        let entriesDictionary = entriesArray.map({ $0.dictionaryCopy() })
        
        // Save to UserDefaults
        NSUserDefaults.standardUserDefaults().setObject(entriesDictionary, forKey: kEntriesKey)
    }
    
    func loadfromPersistenceStorage() {
        
        let entriesDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kEntriesKey) as? [[String: AnyObject]]
        
        if let entriesDictionary = entriesDictionariesFromDefaults {
            
            self.entriesArray = entriesDictionary.map({Entry(dictionary: $0)!})
        }
    }
    
}