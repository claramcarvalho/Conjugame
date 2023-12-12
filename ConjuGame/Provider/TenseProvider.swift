//
//  TenseProvider.swift
//  ConjuGame
//
//  Created by english on 2023-11-13.
//

import Foundation

class TenseProvider {
        
    static var allTenses = [Tense]()
    static var allQuestions = [Question]()
    static var listRandomQuestions = [Question]()
    
    static var listDebutant = ["Indicatif Present","Indicatif Imparfait"]
    static var listIntermediate = ["Futur Simple","Passe Simple","Indicatif Present","Indicatif Imparfait"]
    
    static func generateListTenses() {
        // beginner
        var listOfConjugatedVerbs = [Conjugate]()
        
        let tense = Tense(verbTense: "Indicatif Present")
        var oneQuestion = Context.verbFromAPI?.indicatif?.present?.i?.split(separator: "'")
        
        //print(oneQuestion![1])
        if (oneQuestion?.count == 1) {
            oneQuestion = oneQuestion![0].split(separator: " ")
        }
        print(oneQuestion![0])
        print(oneQuestion![1])
        var oneConjugate = Conjugate(subject: String(oneQuestion![0]), verb: String(oneQuestion![1]))
        listOfConjugatedVerbs.append(oneConjugate)
        oneQuestion = Context.verbFromAPI?.indicatif?.present?.you?.split(separator: " ")
        oneConjugate = Conjugate(subject: String(oneQuestion![0]), verb: String(oneQuestion![1]))
        listOfConjugatedVerbs.append(oneConjugate)
        oneQuestion = Context.verbFromAPI?.indicatif?.present?.heSheIt?.split(separator: " ")
        oneConjugate = Conjugate(subject: String(oneQuestion![0]), verb: String(oneQuestion![1]))
        listOfConjugatedVerbs.append(oneConjugate)
        tense.allVerbConjugated = listOfConjugatedVerbs
        
        allTenses.append(tense)
        
        /*
        
        let oneConjugate = Conjugate(subject: Subject.Je, verb: "vais")
        let twoConjugate = Conjugate(subject: Subject.Tu, verb: "vas")
        let threeConjugate = Conjugate(subject: Subject.Il, verb: "va")
        
        var listOfConjugatedVerbs = [Conjugate]()
        
        listOfConjugatedVerbs.append(oneConjugate)
        listOfConjugatedVerbs.append(twoConjugate)
        listOfConjugatedVerbs.append(threeConjugate)
        
        let tense1 = Tense(verbTense: "Indicatif Present")
        tense1.allVerbConjugated = listOfConjugatedVerbs
        
        
        let oneConjugate2 = Conjugate(subject: Subject.Je, verb: "allais")
        let twoConjugate2 = Conjugate(subject: Subject.Tu, verb: "allais")
        let threeConjugate2 = Conjugate(subject: Subject.Il, verb: "allait")
        
        var listOfConjugatedVerbs2 = [Conjugate]()
        
        listOfConjugatedVerbs2.append(oneConjugate2)
        listOfConjugatedVerbs2.append(twoConjugate2)
        listOfConjugatedVerbs2.append(threeConjugate2)
        
        
        let tense2 = Tense(verbTense: "Indicatif Imparfait")
        tense2.allVerbConjugated = listOfConjugatedVerbs2
    
        allTenses.append(tense1)
        allTenses.append(tense2)
        
        // intermediate
        let oneConjugate3 = Conjugate(subject: Subject.Je, verb: "allai")
        let twoConjugate3 = Conjugate(subject: Subject.Tu, verb: "allas")
        let threeConjugate3 = Conjugate(subject: Subject.Il, verb: "alla")
        
        var listOfConjugatedVerbs3 = [Conjugate]()
        
        listOfConjugatedVerbs3.append(oneConjugate3)
        listOfConjugatedVerbs3.append(twoConjugate3)
        listOfConjugatedVerbs3.append(threeConjugate3)
        
        let tense3 = Tense(verbTense: "Passe Simple")
        tense3.allVerbConjugated = listOfConjugatedVerbs3
        
        
        let oneConjugate4 = Conjugate(subject: Subject.Je, verb: "irai")
        let twoConjugate4 = Conjugate(subject: Subject.Tu, verb: "iras")
        let threeConjugate4 = Conjugate(subject: Subject.Il, verb: "ira")
        
        var listOfConjugatedVerbs4 = [Conjugate]()
        
        listOfConjugatedVerbs4.append(oneConjugate4)
        listOfConjugatedVerbs4.append(twoConjugate4)
        listOfConjugatedVerbs4.append(threeConjugate4)
        
        let tense4 = Tense(verbTense: "Futur Simple")
        tense4.allVerbConjugated = listOfConjugatedVerbs4
        
        allTenses.append(tense3)
        allTenses.append(tense4)
        */
        
    }
        
    static func generateListQuestions(choice:String) {
              
        var listRandomNums = [Int]()
        //var choice = "Beginner"
        
        switch choice
        {
        case "Beginner":
            for i in 0 ..< TenseProvider.allTenses.count {
                if (listDebutant.contains(TenseProvider.allTenses[i].verbTense)) {
                    let list = TenseProvider.allTenses[i].allVerbConjugated
                    
                    for j in 0 ..< list.count {
                        
                        let oneQuestion = Question(subject: list[j].subject, tense: TenseProvider.allTenses[i].verbTense, verb: list[j].verb, answer: "")
                        
                        allQuestions.append(oneQuestion)
                    }
                }
            }
        case "Intermediate":
            for i in 0 ..< TenseProvider.allTenses.count {
                if (listIntermediate.contains(TenseProvider.allTenses[i].verbTense)) {
                    let list = TenseProvider.allTenses[i].allVerbConjugated
                    
                    for j in 0 ..< list.count {
                        
                        let oneQuestion = Question(subject: list[j].subject, tense: TenseProvider.allTenses[i].verbTense, verb: list[j].verb, answer: "")
                        
                        allQuestions.append(oneQuestion)
                    }
                }
            }
        default:
            for i in 0 ..< TenseProvider.allTenses.count {
                let list = TenseProvider.allTenses[i].allVerbConjugated
                
                for j in 0 ..< list.count {
                    
                    let oneQuestion = Question(subject: list[j].subject, tense: TenseProvider.allTenses[i].verbTense, verb: list[j].verb, answer: "")
                    
                    allQuestions.append(oneQuestion)
                }
            }
        }
        
        // create list of random index
        for i in 0..<2 {
            var randomInt = Int.random(in: 0..<allQuestions.count)
            while (listRandomNums.contains(randomInt)) {
                randomInt = Int.random(in: 0..<allQuestions.count)
            }

            listRandomNums.append(randomInt)
        }
        
        // create random questions
        for i in 0..<listRandomNums.count {
            listRandomQuestions.append(allQuestions[listRandomNums[i]])
        }
        
        print(listRandomQuestions)
    }
}
