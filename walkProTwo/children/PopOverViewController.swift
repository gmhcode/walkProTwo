//
//  PopOverViewController.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

protocol PopOverVCDelegate: class {
    func nextCommand1()
}


// other vc



class PopOverViewController: UIViewController, UIPopoverControllerDelegate {
    
    
    @IBOutlet var tutorialButtons: [UIButton]!
    
    
    @IBAction func press(_ sender: UIButton) {
        if sender.tag == TutorialController.shared.commandArray[0].view.tag{
            delegate?.nextCommand1()
        }
    }
    
    weak var delegate: PopOverVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tutorialButtons[0].layer.borderWidth = 5
    }
    
    
    
    func addHighlight(view: UIButton){
        
        if view.isHighlighted != true {
            
            view.layer.borderWidth = 3.0
            view.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            
            view.layer.shadowColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            view.layer.shadowOpacity = 1
            view.layer.shadowRadius = 5
        }
    }
}

