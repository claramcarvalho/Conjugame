//
//  WelcomeViewController.swift
//  ConjuGame
//
//  Created by english on 2023-11-27.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var chosenLevel : String?
    
    @IBAction func btnAdvancedTouchUpInside(_ sender: Any) {
        //let toGameViewController = segue.destination as! GameViewController
        chosenLevel = "Advanced"
        fetchVerbFromAPI()
        //toGameViewController.receivedLevel = chosenLevel
    }
    
    @IBAction func btnBeginnerTouchUpInside(_ sender: Any) {
        chosenLevel = "Beginner"
        fetchVerbFromAPI()
    }
    
    @IBAction func btnIntermediateTouchUpInside(_ sender: Any) {
        chosenLevel = "Intermediate"
        fetchVerbFromAPI()
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var txtVerb: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func fetchVerbFromAPI () {
        //activityIndicator.startAnimating()
        //let verbFromUser = txtVerb.text
        //var verbFound : FrenchVerb = FrenchVerb()
        
        if !txtVerb.text!.isEmpty {
            let verbFromUser = txtVerb.text
            FrenchVerbAPI.getVerb(verb: verbFromUser!) { verb in
                DispatchQueue.main.async {
                 //self.activityIndicator.stopAnimating()
                 //print(verb)
                 Context.verbFromAPI = verb
                 self.performSegue(withIdentifier: Segue.toGameViewControllerProgramatically, sender: self)
                }
            } failHandler: { httpStatusCode, errorMessage in
                DispatchQueue.main.async {
                    //self.activityIndicator.stopAnimating()
                    Toast.ok(view: self, title: "Verb Not Found", message: "Enter a valid verb")
                }
            }
        }
        else {
            //self.activityIndicator.stopAnimating()
            txtVerb.shake()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //TenseProvider.generateListTenses()
        
        //TenseProvider.generateListQuestions(choice: "Beginner")
        //TenseProvider.generateListQuestions(choice: "Intermediate")
        
        let toGameViewController = segue.destination as! GameViewController
        

        toGameViewController.receivedLevel = chosenLevel!
        
        /*
        if segue.identifier == Segue.toGameViewBeginner {
            TenseProvider.generateListQuestions(choice: "Beginner")
            toGameViewController.receivedLevel = "Beginner"
        } else if segue.identifier == Segue.toGameViewIntermediate {
            TenseProvider.generateListQuestions(choice: "Intermediate")
            toGameViewController.receivedLevel = "Intermediate"
        } else if segue.identifier == Segue.toGameViewAdvanced {
            TenseProvider.generateListQuestions(choice: "Advanced")
            toGameViewController.receivedLevel = "Advanced"
        }
        */
        //let toGameViewController = segue.destination as! GameViewController
    }
}
