//
//  VerbInfinitif.swift
//  ConjuGame
//
//  Created by english on 2023-11-13.
//

import Foundation

// display
class VerbInfinitif {
    
    var verbName : String
    var verbGroup : String
    var allVerbTenses = [Tense]()
    
    init(verbName: String, verbGroup: String, allVerbTenses: [Tense] = [Tense]()) {
        self.verbName = verbName
        self.verbGroup = verbGroup
        self.allVerbTenses = allVerbTenses
    }
}
