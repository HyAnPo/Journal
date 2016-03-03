//
//  FireBase.swift
//  Journal
//
//  Created by Aaron Eliason on 2/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    static let base = Firebase(url: "https://journalastro.firebaseIO.com/")
    static let entryBase = base.childByAppendingPath("entries")
}