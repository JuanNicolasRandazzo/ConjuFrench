//
//  ViewController.swift
//  ConjuFrench
//
//  Created by english on 2023-11-10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtYourEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogIn: UIButton!
    
    public var selectedUser : User?
    public var delegate : SecondViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPassword.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }

    
    
    
    @IBAction func btnShowOrHideTouchDown(_ sender: Any) {
        txtPassword.isSecureTextEntry = false
    }
    
    @IBAction func btnShowOrHideTouchUpInside(_ sender: Any) {
        
        txtPassword.isSecureTextEntry = true
    }
    
    
    @IBAction func btnLogInTouchUpInside(_ sender: Any) {
        
        FrenchVerbAPI.signIn(email: "randazzocastaneda97@gmail.com", password: "123456") { token in
            
            DispatchQueue.main.async {

                Context.loggedUserToken = token
                
                self.performSegue(withIdentifier: Segue.toSecondViewController, sender: self )

            }
            
            
        } failHandler: { httpStatusCode, errorMessage in

            DispatchQueue.main.async {
                
                let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                

            }
        }
        /*
        guard let enteredEmail = txtYourEmail.text, let enteredPassword = txtPassword.text
                
        else{
            
            return
            
        }
        
        let userFound = UserProvider.allUsers.contains{ user in
            
            return user.email == enteredEmail && user.password == enteredPassword
            
        }
        
        if userFound {
            
            do {
                
                performSegue(withIdentifier: "toSecondViewController", sender: self)
                
            }
            
        }
    
        else {
            
            let alertController = UIAlertController(title: "Error", message: "Invalid Email or Password", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
         
         
            
        }
         */
    }
    
     
    
    @IBAction func btnCreateAccountTouchUpInside(_ sender: Any) {
        
        performSegue(withIdentifier: "toFourthViewController" , sender: self)
    }
    
}

