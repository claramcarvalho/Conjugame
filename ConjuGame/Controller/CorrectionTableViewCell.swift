//
//  CorrectionTableViewCell.swift
//  ConjuGame
//  This is the ViewController for Correction
//
//  Created by english on 2023-11-13.
//

import UIKit

class CorrectionTableViewCell: UITableViewCell {

    static let identifier = "CorrectionTableViewCell"
    public var question : Question?
    @IBOutlet weak var lblCorrection: UILabel!
    @IBOutlet weak var lbluserAnswer: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var lblSubject: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setCellContent(question:Question) {
        self.selectionStyle = .none
        self.question = question
        
        lblSubject.text = question.subject
        lbluserAnswer.text = question.answer
        lblCorrection.text = question.verb
        
        
        if (question.answer != question.verb) {
            icon.image = UIImage(named: "Wrong")
        }
    }
    
}
