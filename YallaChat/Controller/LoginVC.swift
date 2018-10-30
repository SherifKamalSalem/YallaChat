//
//  LoginVCViewController.swift
//  YallaChat
//
//  Created by Sherif Kamal on 10/28/18.
//  Copyright © 2018 Sherif Kamal. All rights reserved.
//

import UIKit
import ALThreeCircleSpinner

class LoginVC: UIViewController {

    //Outlets
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    //Variables
    var spinner: ALThreeCircleSpinner?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner = ALThreeCircleSpinner(frame: CGRect(x: (view.frame.width / 2) - 50, y: (view.frame.height / 2) - 25, width: 100, height: 50))
        spinner?.tintColor = #colorLiteral(red: 0.163099885, green: 0.3991414607, blue: 0.5562266111, alpha: 1)
        
        setupView()
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        view.addSubview(spinner!)
        spinner?.startAnimating()
        
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let password = passwordTxt.text, passwordTxt.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner?.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    func setupView() {
        emailTxt.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: PLACEHOLDER_PURPLE_COLOR])
        
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: PLACEHOLDER_PURPLE_COLOR])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
