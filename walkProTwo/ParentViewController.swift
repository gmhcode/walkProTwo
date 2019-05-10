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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        containerView.addSubview(popOverViewController2.view)
        containerView.addSubview(popOverViewController.view)
        
        popOverViewController.view.frame = containerView.bounds
        popOverViewController2.view.frame = containerView.bounds
        
        
        self.addChild(popOverViewController)
        self.addChild(popOverViewController2)
        
        
        
        popOverViewController2.delegate = self
        popOverViewController.delegate = self
        
        let tutorial = Tutorial(title: "test", commandArray:
            [Command(viewController:popOverViewController,view: popOverViewController.tutorialButtons[2]),
             Command(viewController:popOverViewController2,view: popOverViewController2.tutorialButtons[0]),
             Command(viewController:popOverViewController,view: popOverViewController.tutorialButtons[1]),
             Command(viewController:popOverViewController,view: popOverViewController.tutorialButtons[3])])
        
     
        
        TutorialController.shared.begin(tutorial: tutorial, viewController: self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        popOverViewController2.removeFromParent()
        popOverViewController2.view.removeFromSuperview()
        
        popOverViewController.removeFromParent()
        popOverViewController.view.removeFromSuperview()
        
    }
    
    
    
    
//    @IBAction func tapped(_ sender: Any) {
        //        popOverViewController.redButton.backgroundColor = #colorLiteral(red: 0, green: 0.3117855787, blue: 0.9473584294, alpha: 1)
//
//        guard TutorialController.shared.commandArray.isEmpty == false else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
//
//        for i in popOverViewController.tutorialButtons  {
//
//            if i.tag == TutorialController.shared.commandArray[0].view.tag{
//                addBubble(view: i, viewController: popOverViewController)
//            }
//
//        }
        //        addBubble(view: childViewController.redButton , viewController: childViewController)
//    }
    
    
    
    
    
//    func beginTutorial(for viewController: UIViewController){
//        
//        for i in popOverViewController.tutorialButtons  {
//            
//            if i.tag == TutorialController.shared.commandArray[0].view.tag{
//                addBubble(view: i, viewController: popOverViewController)
//            }
//        }
//        //        addBubble(view: popOverViewController.redButton , viewController: popOverViewController)
//    }

    
    
    
    
    
    
//    func addBubble(view: UIView, viewController: UIViewController) {
//
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: "greenPop")
//
//        vc.modalPresentationStyle = UIModalPresentationStyle.popover
//        vc.preferredContentSize = CGSize(width: 300, height: 100)
//        let popover = vc.popoverPresentationController
//        popover?.sourceView = view
//        popover?.sourceRect = view.bounds
//        print(view.bounds)
//        //        popover?.delegate = self as? UIPopoverPresentationControllerDelegate
//        viewController.present(vc, animated: true, completion: nil)
//    }
    
    
    
    
//
//    @IBAction func bringToFrontSecondary(_ sender: Any) {
//        popOverVC2View()
//    }
    
    
    func popOverVC2View(){
        
        containerView.bringSubviewToFront(popOverViewController2.view)
        
//        containerView.addSubview(greenViewController.view)
//        containerView.v .didMove(toParent: self)
//        childViewController.removeFromParent()
//        childViewController.view.removeFromSuperview()
    }
    
    
    
    
    
    
    
    @IBAction func bringToFrontMain(_ sender: Any) {
        popOverVC1View()
    }
    
    
    func popOverVC1View(){
        
        containerView.bringSubviewToFront(popOverViewController.view)

    }
}



extension ParentViewController: PopOverVCDelegate{
    func nextCommand1() {
        TutorialController.shared.nextCommand(containerView: containerView)
    }
}



extension ParentViewController: PopOverVC2Delegate{
    func nextCommand2() {
        TutorialController.shared.nextCommand(containerView: containerView)
    }
}


