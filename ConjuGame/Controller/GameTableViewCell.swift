//
//  GameTableViewCell.swift
//  ConjuGame
//  This is the ViewController for the game
//
//  Created by english on 2023-11-13.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    static let identifier = "GameTableViewCell"

    public var question : Question?
    @IBOutlet weak var txtAnswer: UITextField!
    @IBOutlet weak var lblTense: UILabel!
    @IBOutlet weak var lblSubject: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setCellContent(question: Question) {
        
        self.selectionStyle = .none
        self.question = question
        
        lblSubject.text = question.subject
        lblTense.text = question.tense
    }
    
    @IBAction func txtAnswerEditingChanged(_ sender: Any) {
        
        question?.answer = txtAnswer.text!
    }
    
    @IBAction func txtAnswerEditingDidEnd(_ sender: Any) {
        if (txtAnswer.text!.isEmpty) {
            txtAnswer.shake()
        }
    }
    
}
