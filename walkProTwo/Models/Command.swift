//
//  Command.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit
class Command {
    
    var title : String?
    let viewController : UIViewController
    var view : UIView
    var text : String?
    
    
    init (viewController: UIViewController, view: UIView){
        self.view = view
        self.viewController = viewController
    }
}
