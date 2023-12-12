//
//  Tense.swift
//  ConjuGame
//
//  Created by english on 2023-11-13.
//

import Foundation

class Tense {
    
    // fields
    var verbTense : String
    var allVerbConjugated = [Conjugate]()
    
    init(verbTense: String, allVerbConjugated: [Conjugate] = [Conjugate]()) {
        self.verbTense = verbTense
        self.allVerbConjugated = allVerbConjugated
    }
}
