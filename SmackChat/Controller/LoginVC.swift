//
//  LoginVC.swift
//  SmackChat
//
//  Created by Franziska Kammerl on 9/16/17.
//  Copyright © 2017 Franziska Kammerl. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // Outlets

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Actions
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
    performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    
}
