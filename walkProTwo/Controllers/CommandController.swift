//
//  CommandController.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class CommandController {
    
    static let shared = CommandController()
    var commandsForTutorial1 : [Command] = []
    var commandsForTutorial2 : [Command]?
    var commandsForTutorial3 : [Command]?
    var commandsForTutorial4 : [Command]?
    
    
    
    func createAndPrepareCommand(viewController: String, view: Int, text: String)
    {
        var VC : UIViewController = popOverViewController
        var button = popOverViewController.tutorialButtons[view]
        
        
        switch viewController {
        case "popOverViewController":
            VC = popOverViewController
            button = popOverViewController.tutorialButtons[view]
        case "popOverViewController2":
            VC = popOverViewController2
            button = popOverViewController2.tutorialButtons[view]
        default:
            print("✅ View Controller does not exist")
            return
        }
        
        
        
        
        let command = Command(viewController: VC, view: button)
        command.text = text
        
        commandsForTutorial1.append(command)
    }
}
