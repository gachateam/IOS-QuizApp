//
//  SignUpViewController.swift
//  QuizApp
//
//  Created by Yamikuro on 6/15/21.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var comfirmPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        if userName.text?.isEmpty == true {
            print("Please enter username")
            return
        }
        if email.text?.isEmpty == true {
            print("Please enter email")
            return
        }
        if password.text?.isEmpty == true {
            print("Please enter password")
            return
        }
        if comfirmPass.text != password.text {
            print("Password doesn't match")
            return
        }
        
        signUp()
        print("Sign up successful!")
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (result, error) in
            if let error = error {
                print("Error: ", error.localizedDescription)
                return
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "home")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
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
