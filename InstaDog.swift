//
//  InstaDog.swift
//  AC3.2-InstaCats-2
//
//  Created by Simone Grant on 10/23/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

struct InstaDog {
    let name: String
    let dogID: Int
    let instagramURL: URL
    
    init(name: String, dogID: Int, instagramURL: URL) {
        self.name = name
        self.dogID = dogID
        self.instagramURL = instagramURL
    }
    
    public var description: String {
        return "Woof to me you, I'm \(self.name)"
    }
}
