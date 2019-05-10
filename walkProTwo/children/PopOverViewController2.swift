//
//  PopOverViewController2.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

protocol PopOverVC2Delegate: class {
    func nextCommand2()
}


class PopOverViewController2: UIViewController {
    
    @IBOutlet var tutorialButtons: [UIButton]!
    
    @IBAction func press(_ sender: UIButton) {
        if sender.tag == TutorialController.shared.commandArray[0].view.tag{
            delegate?.nextCommand2()
        }
    }
    
    weak var delegate: PopOverVC2Delegate?
    
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
