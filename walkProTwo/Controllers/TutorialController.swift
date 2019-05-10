//
//  TutorialController.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class TutorialController {
    
    static let shared = TutorialController()
    
    var commandArray : [Command] = []
    var currentTutorial : Tutorial?
    var previousVC : UIViewController?
    var tutorials : [Tutorial] = []
    
    
    func addCommand(for tutorial: Tutorial, command: Command){
        tutorial.commandArray.append(command)
    }
    
    
    //MARK: Create Tutorial
    func createTutorial(commands: [Command]){
        
        let newTutorial = Tutorial(title: "test1", commandArray: commands)
        tutorials.append(newTutorial)
        
        print(tutorials[0])
    }
    
    
    func begin(tutorial: Tutorial, viewController: UIViewController){
        
        currentTutorial = tutorial
        commandArray = []
        guard tutorial.commandArray.isEmpty == false else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        
        commandArray.append(contentsOf: tutorial.commandArray)
        
        
        previousVC = commandArray[0].viewController
        addBubble(view: commandArray[0].view, viewController: viewController)
        addHighlight(view: commandArray[0].view)
    }
    
    
    
    func addBubble(view: UIView, viewController: UIViewController) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "greenPop")
        
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.preferredContentSize = CGSize(width: 300, height: 100)
        let popover = vc.popoverPresentationController
        popover?.sourceView = view
        popover?.sourceRect = view.bounds
        
        popover?.delegate = self as? UIPopoverPresentationControllerDelegate
        
        
        viewController.present(vc, animated: true, completion: nil)
    }
    
    
    
    func nextCommand(containerView: UIView){
        
        guard commandArray.isEmpty == false else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        removeHighlight(view: commandArray[0].view)
        commandArray.remove(at: 0)
        
       
        if commandArray.isEmpty == false {
            if commandArray[0].viewController != previousVC{
                containerView.bringSubviewToFront(commandArray[0].viewController.view)
                previousVC = commandArray[0].viewController
            }
            addHighlight(view: commandArray[0].view)
            addBubble(view: commandArray[0].view, viewController: commandArray[0].viewController)
        }
    }
    
    
    
    func addHighlight(view: UIView){
        
        view.layer.borderWidth = 10.0
        view.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        view.layer.shadowColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        view.layer.shadowOpacity = 1
        
    }
    
    
    
    func removeHighlight(view: UIView){
        view.layer.borderWidth = 0
        view.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        
        view.layer.shadowColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 0)
        view.layer.shadowOpacity = 0
    }
}








