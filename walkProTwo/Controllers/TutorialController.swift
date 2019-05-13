//
//  TutorialController.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit


protocol TutorialControllerDelegate: class {
    func nextCommand()
}


class TutorialController:NSObject {
    
    static let shared = TutorialController()
    weak var delegate: TutorialControllerDelegate?
    
    var currentTutorial : Tutorial?
    var previousVC : UIViewController?
    var commands : [Command] = []
    var tutorials : [Tutorial] = []
    
    
    
    
    
    //MARK: Begin Tutorial
    
    func begin(tutorial: Tutorial, viewController: UIViewController){
        
        currentTutorial = tutorial
//      make commands empty to clear out previous tutorials commands
        commands = []
        guard tutorial.commandArray.isEmpty == false else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        
        commands.append(contentsOf: tutorial.commandArray)
        
        
        previousVC = commands[0].viewController
        addBubble(view: commands[0].view, viewController: viewController)
        addHighlight(view: commands[0].view)
    }
    
    
    
    //MARK: add popover bubble
    func addBubble(view: UIView, viewController: UIViewController) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "greenPop") as! GreenViewController
        
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.preferredContentSize = CGSize(width: 300, height: 100)
        
        
        let popover = vc.popoverPresentationController
        popover!.delegate = self
        popover?.sourceView = view
        popover?.sourceRect = view.bounds
        popover?.passthroughViews = viewController.view.subviews
  
        
        viewController.present(vc, animated: true, completion: nil)
    }
    
    
   
    //proceeds through the command list
    func nextCommand(containerView: UIView){
        
        #warning("trying to only dismiss the tutorial, may have unintended consequences such as dismissing views we didnt want to dismiss")
        commands[0].viewController.dismiss(animated: true, completion: nil)
        
        guard commands.isEmpty == false else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
//        remove highlight and command so we can proceed to the next command
        removeHighlight(view: commands[0].view)
        commands.remove(at: 0)
        
        //TODO: make this more elegant, may cause bugs
        if commands.isEmpty == false {
            if commands[0].viewController != previousVC{
                
                
                #warning("we shouldnt need bringSubviewToFront. if the button theyre supposed to press goes to the new view then it will happen auto")
                containerView.bringSubviewToFront(commands[0].viewController.view)
                
                
                
            previousVC = commands[0].viewController
            }
            
            addHighlight(view: commands[0].view)
            addBubble(view: commands[0].view, viewController: commands[0].viewController)
        }
    }

    
    
//    unused, was able to use container view instead
//    we need this to be able to tell parent view controller FROM THE CHILD view controllers to begin the next command
    func nextCommandDelegate(){
        delegate?.nextCommand()
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


//MARK: making tutorials
extension TutorialController {
    
    //MARK: Create Tutorial
    func createTutorial(title: String, commands: [Command]){
        
        let newTutorial = Tutorial(title: title, commandArray: commands)
        tutorials.append(newTutorial)
        
//        print(tutorials)
    }
    
    
    func addCommand(for tutorial: Tutorial, command: Command, index: Int?){
        //if index is nil, append new command to end of command list. if its not nil, insert command to specified index
        index == nil ? tutorial.commandArray.append(command) : tutorial.commandArray.insert(command, at: index ?? tutorial.commandArray.count - 1)
    }
    
    
    func addCommands(for tutorial: Tutorial, commands: [Command], index: Int?){
        //if index is nil, append new command to end of command list. if its not nil, insert command to specified index
        index == nil ? tutorial.commandArray.append(contentsOf: commands) : tutorial.commandArray.insert(contentsOf: commands, at: index ?? tutorial.commandArray.count - 1)
    }
    
    func removeCommand(tutorial: Tutorial, index: Int){
        tutorial.commandArray.remove(at: index)
    }
    
    func replaceCommand(tutorial: Tutorial, index: Int, command: Command){
        
        tutorial.commandArray.remove(at: index)
        tutorial.commandArray.insert(command, at: index)
        
    }
}





extension TutorialController: UIPopoverPresentationControllerDelegate{
    //    we need this to be false so the popover will not dismiss until the user taps the correct button. in which case the nextCommand() function will dismiss the popover
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return false
    }
}
