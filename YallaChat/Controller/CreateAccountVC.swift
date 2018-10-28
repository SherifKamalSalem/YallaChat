//
//  CreateAccountVC.swift
//  YallaChat
//
//  Created by Sherif Kamal on 10/28/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func closeBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
