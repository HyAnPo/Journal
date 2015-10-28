//
//  EntryController.swift
//  Journal
//
//  Created by Andrew Porter on 10/26/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entriesKey = "entries"
    
    
    // MARK: Had to reference the master for help with shared instance
    static let sharedController = EntryController()
    
    var entries: [Entry]
    
    init() {
        self.entries = []
        
        self.loadFromPersistentStorage()
    }
    
        // MARK: - Study
        // Got confused with the entries array. Originally I had set it to be and array of strings but it's actually an array of Entry's.
        func addEntry(entry: Entry) {
            // adds the entry parameter to the entries array
            
            entries.append(entry)
            
            saveToPersistentStorage()
        }
        
        // MARK: Study
        // My first attempt was to use a for loop to find the matching entry index.
        // The master uses an if let statement to see if an entry exists, if so the entry is removed from that index.
        func removeEntry(entry: Entry) {
            // This creates a let to hold the index of an entry if it exists
            if let entryIndex = entries.indexOf(entry) {
                entries.removeAtIndex(entryIndex)
                
                saveToPersistentStorage()
            }
        }
    
    func loadFromPersistentStorage() {
        //MARK: - Study
        
        // Takes the dictionary that was created from an object and casts it into a new dictionary
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [Dictionary<String, AnyObject>]
        
        if let entryDictionaries = entryDictionariesFromDefaults {
            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
        }
    }
    
    func saveToPersistentStorage() {
        
        //MARK: - Study
        //I don't understand this syntax
        let entryDictionaries = self.entries.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entriesKey)
    }
}