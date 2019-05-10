//
//  CreateTutorialViewController.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class CreateTutorialViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var VCtextField: UITextField!
    @IBOutlet weak var viewNumberTextField: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    

    @IBAction func addCommands(_ sender: Any) {
        
        guard let VCText = VCtextField.text, let VCNumber = Int(viewNumberTextField.text ?? "0") else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        
        CommandController.shared.createAndPrepareCommand(viewController: VCText, view: VCNumber)
        
        
        
        
    }
    @IBAction func createTutorialTapped(_ sender: Any) {
        
        TutorialController.shared.createTutorial(commands: CommandController.shared.commandsForTutorial1)
    }
    
    
    

}
extension CreateTutorialViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childViewControllers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.textLabel?.text = "\(childViewControllers[indexPath.row])"
        
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "popOverViewController"
        }else if indexPath.row == 1 {
            cell.textLabel?.text = "popOverViewController2"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        VCtextField.text = childViewControllers[indexPath.row]
        
    }
    
}
