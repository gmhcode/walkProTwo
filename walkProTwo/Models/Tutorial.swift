//
//  Tutorial.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class Tutorial {
    
    let title : String
    var commandArray : [Command]
    
    init(title: String, commandArray: [Command]){
        self.title = title
        self.commandArray = commandArray
    }
}

extension Tutorial: Equatable {
    static func == (lhs: Tutorial, rhs: Tutorial) -> Bool {
        
        return lhs.title == rhs.title && lhs.commandArray == rhs.commandArray
    }
}
