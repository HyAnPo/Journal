//
//  EntryController.swift
//  Journal
//
//  Created by Andrew Porter on 2/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    private let kEntriesKey = "entries"
    
    static let sharedInstance = EntryController()
    
    var entriesArray: [Entry] = []
    
    init() {
        loadFromUserDefaults()
    }
    
    
    //CREATE
    func addEntry(entry: Entry) {
        entriesArray.append(entry)
        
        saveToPersistence(self.entriesArray)
    }
    
    //READ
    func loadFromUserDefaults() {
        
        let dataFromUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kEntriesKey) as? [[String: AnyObject]]
        
        if let entriesDictionary = dataFromUserDefaults {
            self.entriesArray = entriesDictionary.map({ Entry(dictionary: $0)! })
        }
    }
    
    //UPDATE
    func saveToPersistence(entriesArray: [Entry]) {
        
        //Convert array of entry objects into dictionary
        let dictionary = entriesArray.map({ $0.dictionaryCopy() })
        
        NSUserDefaults.standardUserDefaults().setValue(dictionary, forKey: kEntriesKey)
    }
    
    //DELETE
    func deleteEntry(entry: Entry) {
        
        let indexOfEntry = entriesArray.indexOf(entry)
        
        if let index = indexOfEntry {
            entriesArray.removeAtIndex(index)
        }
        
        saveToPersistence(self.entriesArray)
    }
}