//
//  GameViewController.swift
//  ConjuGame
//
//  Created by english on 2023-11-27.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var receivedLevel : String = ""
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func btnCheckTouchUpInside(_ sender: Any) {
    }
    
    @IBOutlet weak var headerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {

        TenseProvider.generateListTenses()
        TenseProvider.generateListQuestions(choice: receivedLevel)

        tableView.register(UINib(nibName:GameTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: GameTableViewCell.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        switch receivedLevel
        {
        case "Beginner":
            headerView.backgroundColor = .yellow
        case "Intermediate":
            headerView.backgroundColor = .blue
        default:
            headerView.backgroundColor = .green
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TenseProvider.listRandomQuestions.count
        //return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var question : Question
        
        question = TenseProvider.listRandomQuestions[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.identifier, for: indexPath) as! GameTableViewCell
        
        cell.setCellContent(question: question)
        
        return cell
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == Segue.toCorrectionViewController {
            
            var perform = true
            for i in 0 ..< TenseProvider.listRandomQuestions.count {
                let question = TenseProvider.listRandomQuestions[i]
                
                if (question.answer.isEmpty) {
                    perform = false
                    break
                }
            }
            
            if !perform {
                Toast.ok(view: self, title: "Missing Fields", message: "Please, fill in all fields")
                return false

            }
            
            return true
        }

        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}

