//
//  CorrectionViewController.swift
//  ConjuGame
//
//  Created by english on 2023-11-27.
//

import UIKit

class CorrectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var point = 0
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
    }
    
    func initialize() {
        
        tableView.register(UINib(nibName:CorrectionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CorrectionTableViewCell.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        for i in 0 ..< TenseProvider.allQuestions.count {
            let question =  TenseProvider.allQuestions[i]
            if (question.answer == question.verb) {
                point += 1
            }
        }
        
        lblScore.text = String(point) + "/10"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TenseProvider.allQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var question : Question
        
        question = TenseProvider.allQuestions[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CorrectionTableViewCell.identifier, for: indexPath) as! CorrectionTableViewCell
        
        cell.setCellContent(question: question)
        tableView.rowHeight = 60
        
        return cell
    }

}
