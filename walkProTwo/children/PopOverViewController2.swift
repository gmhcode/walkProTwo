//
//  PopOverViewController2.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit


class PopOverViewController2: UIViewController {
    
    @IBOutlet var tutorialButtons: [UIButton]!
    @IBAction func press(_ sender: UIButton) {
        
        if TutorialController.shared.commands.isEmpty == false{
            
            if sender.tag == TutorialController.shared.commands[0].view.tag{
//                TutorialController.shared.nextCommandDelegate()
                guard let parent = self.parent as? ParentViewController else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
                
                TutorialController.shared.nextCommand(containerView: parent.containerView)
            }
        } else {
            print("🎢 no commands available")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
