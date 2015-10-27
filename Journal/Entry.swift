//
//  Entry.swift
//  Journal
//
//  Created by Andrew Porter on 10/26/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    let title: String
    let timestamp: NSDate
    let bodyText: String
    
    init(title: String, timestamp: NSDate, bodyText: String) {
        self.title = title
        self.timestamp = NSDate()
        self.bodyText = bodyText
        
    }
    
}

// MARK: Study
// I first tried to put this function inside the Entry class.
// Why is this outside of the class?
func == (lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) ==  ObjectIdentifier(rhs)
}