//
//  FourthViewController.swift
//  ConjuFrench
//
//  Created by english on 2023-11-10.
//

import UIKit

protocol ViewControllerDelegate{
    
    func refreshList()
}
class FourthViewController: UIViewController {

    @IBOutlet weak var txtNewUsername: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    
    public var selectedUser : User?
    public var delegate : ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnSignUpTouchUpInside(_ sender: Any) {
        
        if selectedUser != nil{
            selectedUser?.email = txtNewUsername.text!
            selectedUser?.password = txtNewPassword.text!
        
        }
        if delegate != nil{
            delegate?.refreshList()
        }
        navigationController?.popViewController(animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
