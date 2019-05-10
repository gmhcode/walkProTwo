//
//  VCSourceOfTruth.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit



var childViewControllers = ["popOverViewController", "popOverViewController2"]


var popOverViewController: PopOverViewController = {
    // Load Storyboard
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    // Instantiate View Controller
    var viewController = storyboard.instantiateViewController(withIdentifier: "PopOverViewController") as! PopOverViewController
    
    // Add View Controller as Child View Controller
    
    
    // viewController.view.frame = containerView.bounds
    // self.addChild(viewController)
    
    return viewController
}()



var popOverViewController2: PopOverViewController2 = {
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    var viewController = storyboard.instantiateViewController(withIdentifier: "PopOverViewController2") as! PopOverViewController2
    
    // viewController.view.frame = containerView.bounds
    // self.addChild(viewController)
    return viewController
}()




