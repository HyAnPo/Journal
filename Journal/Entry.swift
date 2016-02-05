//
//  Entry.swift
//  Journal
//
//  Created by Andrew Porter on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.title == rhs.title && lhs.timestamp == rhs.timestamp && lhs.body == rhs.body
    
}

class Entry: Equatable {
    
    var timestamp: NSDate
    var title: String
    var body: String?
    
    init(timestamp: NSDate = NSDate(), title: String, body: String?) {
        self.timestamp = timestamp
        self.title = title
        self.body = body
    }
}
