//
//  ViewController.swift
//  ConjuGame
//  This is the main entry point of the program
//
//  Created by english on 2023-11-10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FrenchVerbAPI.signIn(email: "guest@gmail.com", password: "guest") { token in
            //sending message of success login
            print("Logged in with token \(token)")
            //saving the token
            Context.loggedUserToken = token
        } failHandler: { httpStatusCode, errorMessage in
            //sending error message
            //print("Fail with httpcode \(httpStatusCode) - \(errorMessage)")
        }
        
    }

}

