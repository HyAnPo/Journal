//
//  Entry.swift
//  Journal
//
//  Created by Andrew Porter on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    var timestamp: NSDate
    var title: String
    var bodyText: String
    
    // TODO: Not sure if the timestamp defaut is set right.
    init(title: String, bodyText: String) {
        self.timestamp = NSDate()
        self.title = title
        self.bodyText = bodyText
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return (lhs.title == rhs.title) &&
           (lhs.bodyText == rhs.bodyText) &&
           (lhs.timestamp == rhs.timestamp)
}
