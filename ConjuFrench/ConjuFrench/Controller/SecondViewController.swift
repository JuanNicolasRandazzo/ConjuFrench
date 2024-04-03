//
//  SecondViewController.swift
//  ConjuFrench
//
//  Created by english on 2023-11-10.
//

import UIKit

protocol SecondViewControllerDelegate {
    func eraseVerb()
    func conjugateVerb()
}
class SecondViewController: UIViewController {

    @IBOutlet weak var txtVerb: UITextField!
    public var selectedVerb: InfoVerb?
    public var delegate: SecondViewControllerDelegate?
    var enteredVerb: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedVerb != nil {
            
            let task = selectedVerb!
            
            txtVerb.text = task.verbInfo //task.verb
            
        } else {
            
            return
            //return eraseVerb().refresh
            
        }

        // Do any additional setup after loading the view.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdViewController"{
            
            if let destinationVC = segue.destination as? ThirdViewController{
                destinationVC.verbToDisplay = txtVerb.text
            }
        }
    }
    
    
    
  /*
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let enteredVerb = txtVerb.text {
            
            if let delegate = self.delegate {
                delegate.eraseVerb()
                delegate.conjugateVerb()
            }
            self.enteredVerb = txtVerb.text
            return true
        }
        return false
        
        //navigationController?.popViewController(animated: true)
        
    }
   */
    
    @IBAction func btnConjugateTouchUpInside(_ sender: Any) {
        
        if let enteredVerb = txtVerb.text {
            
            if let delegate = self.delegate {
                delegate.eraseVerb()
                delegate.conjugateVerb()
            }
            self.enteredVerb = txtVerb.text
            
        }
        
        
        
        FrenchVerbAPI.getVerb(verb: "Aimer") { verb in
        
            DispatchQueue.main.async{
                
                Context.verb = verb
                
                self.performSegue(withIdentifier: Segue.toThirdViewController, sender: self)
                
                // print(verb.fullDescription!)
            }
            
        } failHandler: { httpStatusCode, errorMessage in
        
            print("Failed with httpCode \(httpStatusCode) - \(errorMessage)")
            
        }
        
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
