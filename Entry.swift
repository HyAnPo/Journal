//
//  Entry.swift
//  Journal
//
//  Created by Andrew Porter on 2/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    var title: String
    var body: String?
    var timestamp: NSDate
    
    init(title: String, body: String?, timestamp: NSDate = NSDate()) {
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.title == rhs.title && lhs.body == rhs.body && lhs.timestamp == rhs.timestamp
}