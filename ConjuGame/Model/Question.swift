//
//  Question.swift
//  ConjuGame
//
//  Created by english on 2023-11-13.
//

import Foundation

class Question {
    
    // fields
    var subject : String
    var tense : String
    var verb : String
    var answer : String
    
    init(subject: String, tense: String, verb: String, answer: String) {
        self.subject = subject
        self.tense = tense
        self.verb = verb
        self.answer = answer
    }
}

