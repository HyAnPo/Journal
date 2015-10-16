//
//  Entry.swift
//  Journal
//
//  Created by Andrew Porter on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    private let timestampKey = "timestamp"
    private let titleKey = "title"
    private let bodyTextKey = "bodyText"
    var timestamp: NSDate
    var title: String
    var bodyText: String
    
    // TODO: Not sure if the timestamp defaut is set right.
    init(title: String, bodyText: String) {
        self.timestamp = NSDate()
        self.title = title
        self.bodyText = bodyText
    }
    
    
    init?(dictionary: Dictionary<String, AnyObject>){
        guard let timestamp = dictionary[timestampKey] as? NSDate,
              let title = dictionary[titleKey] as? String,
            let bodyText = dictionary[bodyTextKey] as? String else{
        
            self.timestamp = NSDate()
            self.title = ""
            self.bodyText = ""
        
            return nil
        }
        self.timestamp = timestamp
        self.title = title
        self.bodyText = bodyText
        
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        let dictionary:  Dictionary<String, AnyObject> = [
            timestampKey: self.timestamp,
            titleKey: self.title,
            bodyTextKey: self.bodyText
        ]
        return dictionary
    }
    
}



func ==(lhs: Entry, rhs: Entry) -> Bool {
    return (lhs.title == rhs.title) &&
           (lhs.bodyText == rhs.bodyText) &&
           (lhs.timestamp == rhs.timestamp)
}
