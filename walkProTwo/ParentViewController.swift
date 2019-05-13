//
//  ViewController.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {
    
    
    
    @IBOutlet weak var containerView: UIView!
    
    var tutorials : [Tutorial]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSubviewsAndChildren()
        
        
        tutorials = [Tutorial(title: "test", commandArray:
            [Command(viewController:popOverViewController,view: popOverViewController.tutorialButtons[2]),Command(viewController:popOverViewController2,view: popOverViewController2.tutorialButtons[0]),Command(viewController:popOverViewController,view:popOverViewController.tutorialButtons[1]),Command(viewController:popOverViewController,view: popOverViewController.tutorialButtons[3])]),Tutorial(title: "test2", commandArray:
                [Command(viewController:popOverViewController,view: popOverViewController.tutorialButtons[1]),Command(viewController:popOverViewController2,view: popOverViewController2.tutorialButtons[1]),Command(viewController:popOverViewController,view:popOverViewController.tutorialButtons[1]),Command(viewController:popOverViewController,view: popOverViewController.tutorialButtons[1])]),Tutorial(title: "test3", commandArray:
                    [Command(viewController:popOverViewController,view: popOverViewController.tutorialButtons[0]),Command(viewController:popOverViewController2,view: popOverViewController2.tutorialButtons[0]),Command(viewController:popOverViewController,view:popOverViewController.tutorialButtons[0]),Command(viewController:popOverViewController,view: popOverViewController.tutorialButtons[0])])]
        
        if TutorialController.shared.tutorials.isEmpty {
            TutorialController.shared.tutorials = tutorials!
            TutorialController.shared.currentTutorial = tutorials?[0]
        }
        
//        TutorialController.shared.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
   
    
    func setSubviewsAndChildren(){
        containerView.addSubview(popOverViewController2.view)
        containerView.addSubview(popOverViewController.view)
        
        popOverViewController.view.frame = containerView.bounds
        popOverViewController2.view.frame = containerView.bounds
        
        
        self.addChild(popOverViewController)
        self.addChild(popOverViewController2)
    }
    
    
    
    
    //unused
    func removeSubViews(){
        popOverViewController2.removeFromParent()
        popOverViewController2.view.removeFromSuperview()
        
        popOverViewController.removeFromParent()
        popOverViewController.view.removeFromSuperview()
    }
    
    
    //unused
    func popOverVC2View(){
        
        containerView.bringSubviewToFront(popOverViewController2.view)

    }
    
    
    @IBAction func beginTutorialButtonTapped(_ sender: Any) {
        
        
        guard let tutorial = TutorialController.shared.currentTutorial else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        TutorialController.shared.begin(tutorial: tutorial, viewController: self)
        
        
    }
}

//extension ParentViewController: TutorialControllerDelegate{
//    func nextCommand() {
//        TutorialController.shared.nextCommand(containerView: containerView)
//    }
//}








