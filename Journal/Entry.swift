//
//  Entry.swift
//  Journal
//
//  Created by Andrew Porter on 10/26/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let titleKey = "title"
    private let timestampKey = "timestamp"
    private let bodyTextKey = "bodyText"
    
    var title: String
    var timestamp: NSDate
    var bodyText: String
    
    init(title: String, timestamp: NSDate = NSDate(), bodyText: String) {
        self.title = title
        self.timestamp = NSDate()
        self.bodyText = bodyText
        
    }
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let timestamp = dictionary[timestampKey] as? NSDate,
            let bodyText = dictionary[bodyTextKey] as? String,
            let title = dictionary[titleKey] as? String else {
                
                // sets values for stored properties due to requirment as of Swift 2.0
                self.title = ""
                self.timestamp = NSDate()
                self.bodyText = ""
                
                return nil
        }
        
        self.title = title
        self.timestamp = timestamp
        self.bodyText = bodyText
    }
    
    // MARK: - Study
    func dictionaryCopy() -> [String:AnyObject] {
        
        let dictionary = [
            timestampKey : self.timestamp,
            titleKey : self.title,
            bodyTextKey : self.bodyText
        ]
        return dictionary
    }
}

// MARK: Study
// I first tried to put this function inside the Entry class.
// Why is this outside of the class?
func == (lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) ==  ObjectIdentifier(rhs)
}