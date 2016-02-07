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
    
    private let kTimestampKey = "timestamp"
    private let kTitleKey = "title"
    private let kBodyKey = "body"
    
    var timestamp: NSDate
    var title: String
    var body: String?
    
    init(timestamp: NSDate = NSDate(), title: String, body: String?) {
        self.timestamp = timestamp
        self.title = title
        self.body = body
    }
    
    // Factory methods
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let timestamp = dictionary[kTimestampKey] as? NSDate, title = dictionary[kTitleKey] as? String, body = dictionary[kBodyKey] as? String else {
            
            self.timestamp = NSDate()
            self.title = ""
            self.body = ""
            
            return nil
        }
        
        self.timestamp = timestamp
        self.title = title
        self.body = body
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        
        var dictionary: [String: AnyObject] = [kTimestampKey: self.timestamp, kTitleKey: self.title]
        
        if let body = self.body {
            dictionary[kBodyKey] = body
        }
        
        return dictionary
    }
}
