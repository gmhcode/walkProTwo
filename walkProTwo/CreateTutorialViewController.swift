//
//  CreateTutorialViewController.swift
//  walkProTwo
//
//  Created by Greg Hughes on 5/10/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

class CreateTutorialViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tutorialNameLabel: UILabel!
    @IBOutlet weak var tutorialTableView: UITableView!
    @IBOutlet weak var viewControllerTableView: UITableView!
    @IBOutlet weak var commandsTableView: UITableView!
    
    
    @IBOutlet weak var VCtextField: UITextField!
    @IBOutlet weak var viewNumberTextField: UITextField!
    @IBOutlet weak var addTextTextField: UITextField!
    
    
    var selectedTutorial : Tutorial? {
        didSet {
            tutorialNameLabel.text = selectedTutorial?.title
        }
    }
    var selectedCommand : Command?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorialTableView.delegate = self
        tutorialTableView.dataSource = self
        commandsTableView.delegate = self
        commandsTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func addCommands(_ sender: Any) {
        
        guard let VCText = VCtextField.text, let VCNumber = Int(viewNumberTextField.text ?? "0"), let commandText = addTextTextField.text else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        
        CommandController.shared.createAndPrepareCommand(viewController: VCText, view: VCNumber, text: commandText)
    }
    
    
    
    @IBAction func createTutorialTapped(_ sender: Any) {
        
        if selectedTutorial != nil {
            
            TutorialController.shared.addCommands(for: selectedTutorial!, commands: CommandController.shared.commandsForTutorial1, index: nil)
            
            commandsTableView.reloadData()
            
        }
        else {
            
            TutorialController.shared.createTutorial(title: "test" + String(TutorialController.shared.tutorials.count), commands: CommandController.shared.commandsForTutorial1)
            
            tutorialTableView.reloadData()
        }
    }
    
    @IBAction func chooseTutorialButtonTapped(_ sender: Any) {
        
        TutorialController.shared.tutorials.append(Tutorial(title: "test" + String(TutorialController.shared.tutorials.count + 1), commandArray: []))
        selectedTutorial = TutorialController.shared.tutorials.last
        
        
        tutorialTableView.reloadData()
    }
    @IBAction func removeCommand(_ sender: Any) {
    }
    
    func removeCommand()
    {
        
        if selectedCommand != nil {
            var index = -1
            
            for i in selectedTutorial!.commandArray {
                index += 1
                print(index)
                if i == selectedCommand {
                    break
                }
            }
            TutorialController.shared.removeCommand(tutorial: selectedTutorial!, index: index)
            commandsTableView.reloadData()
        }
    }
}



extension CreateTutorialViewController {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == viewControllerTableView {
            return childViewControllers.count
        }
        if tableView == tutorialTableView {
            return TutorialController.shared.tutorials.count
        }
        if tableView == commandsTableView {
            
            guard let currentTutorial = TutorialController.shared.currentTutorial else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return 0  }
            
            return currentTutorial.commandArray.count
        }
        return 5
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == viewControllerTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "viewControllerTableViewcell", for: indexPath)
            
            cell.textLabel?.text = "\(childViewControllers[indexPath.row])"
            
            if indexPath.row == 0 { cell.textLabel?.text = "popOverViewController"}
            else if indexPath.row == 1 {cell.textLabel?.text = "popOverViewController2"}
            
            return cell
        }
        
        if tableView == tutorialTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tutorialTableViewcell", for: indexPath)
            
            
            cell.textLabel?.text = TutorialController.shared.tutorials[indexPath.row].title
            
            
            return cell
        }
        if tableView == commandsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "commandsCell", for: indexPath)
            cell.textLabel?.text = TutorialController.shared.currentTutorial?.commandArray[indexPath.row].text
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == viewControllerTableView {
            VCtextField.text = childViewControllers[indexPath.row]
            
        }
        if tableView == tutorialTableView{
            
            let selectedTutorial = TutorialController.shared.tutorials[indexPath.row]
            TutorialController.shared.currentTutorial = selectedTutorial
            
            self.selectedTutorial = TutorialController.shared.tutorials[indexPath.row]
            alert(string: TutorialController.shared.tutorials[indexPath.row].title)
            commandsTableView.reloadData()
        }
        
        if tableView == commandsTableView {
            selectedCommand = selectedTutorial?.commandArray[indexPath.row]
            
            
            
        }
    }
}


extension CreateTutorialViewController {
    func alert(string: String){
        
        let alertController = UIAlertController(title: "\(string) is now active)", message: "\(string) is now active)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        
        present(alertController, animated: true)
        
    }
}
