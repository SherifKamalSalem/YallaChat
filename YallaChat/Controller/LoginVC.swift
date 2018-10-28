//
//  LoginVCViewController.swift
//  YallaChat
//
//  Created by Sherif Kamal on 10/28/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
}
