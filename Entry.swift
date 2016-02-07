//
//  Entry.swift
//  Journal
//
//  Created by Andrew Porter on 2/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let kTitleKey = "title"
    private let kBodyKey = "body"
    private let kTimestamp = "timestamp"
    
    var title: String
    var body: String?
    var timestamp: NSDate
    
    init(title: String, body: String?, timestamp: NSDate = NSDate()) {
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
    
    //MARK: - Factory methods
    init?(dictionary: [String: AnyObject]) {
        guard let timestamp = dictionary[kTimestamp] as? NSDate, title = dictionary[kTitleKey] as? String, body = dictionary[kBodyKey] as? String else {
            self.title = ""
            self.body = ""
            self.timestamp = NSDate()
            
            return nil
        }
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        var dictionary: [String: AnyObject] = [:]
        dictionary[kTitleKey] = self.title
        dictionary[kBodyKey] = self.body
        dictionary[kTimestamp] = self.timestamp
        
        return dictionary
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.title == rhs.title && lhs.body == rhs.body && lhs.timestamp == rhs.timestamp
}