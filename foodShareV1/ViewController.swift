//
//  ViewController.swift
//  foodShareV1
//
//  Created by Sahil Jain on 3/17/17.
//  Copyright © 2017 foodShare. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet var logoutButton: UIButton!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "foodb.jpg")!)
        if let user = FIRAuth.auth()?.currentUser{
            /**let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "UserViewController")
            self.present(controller, animated: true, completion: nil)**/
            self.logoutButton.alpha = 1.0
        }
        else{
            self.logoutButton.alpha=0.0
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createAccountAction(_ sender: Any) {
        
            if(self.emailField.text==""||self.passwordField.text=="")
            {
                let alertController = UIAlertController(title: "Oops!", message: "Please enter a valid email and password", preferredStyle: .alert )
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                FIRAuth.auth()?.createUser(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: {(user,error) in
                    if error == nil{
                        self.logoutButton.alpha = 1.0
                        
                        self.emailField.text = ""
                        self.passwordField.text = ""
                        /**let alertController = UIAlertController(title: "Successfully logged in", message: nil, preferredStyle: .alert )
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)**/
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let controller = storyboard.instantiateViewController(withIdentifier: "UserViewController")
                        self.present(controller, animated: true, completion: nil)
                    }
                    else{
                        let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert )
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                })
                
            }
    }
    
    @IBAction func signInAction(_ sender: Any) {
        if(self.emailField.text==""||self.passwordField.text=="")
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter a valid email and password", preferredStyle: .alert )
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            FIRAuth.auth()?.signIn(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: {(user,error) in
                if error == nil{
                    self.logoutButton.alpha = 1.0
                    self.emailField.text = ""
                    self.passwordField.text = ""
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "UserViewController")
                    self.present(controller, animated: true, completion: nil)
                    /**let alertController = UIAlertController(title: "Successfully logged in", message: nil, preferredStyle: .alert )
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
 **/
                    
                }
                else{
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert )
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }
    }

    @IBAction func chefSignIn(_ sender: Any) {
        if(self.emailField.text==""||self.passwordField.text=="")
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter a valid email and password", preferredStyle: .alert )
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            FIRAuth.auth()?.signIn(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: {(user,error) in
                if error == nil{
                    self.logoutButton.alpha = 1.0
                    self.emailField.text = ""
                    self.passwordField.text = ""
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "chef")
                    self.present(controller, animated: true, completion: nil)
                    /**let alertController = UIAlertController(title: "Successfully logged in", message: nil, preferredStyle: .alert )
                     let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                     alertController.addAction(defaultAction)
                     self.present(alertController, animated: true, completion: nil)
                     **/
                    
                }
                else{
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert )
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }

    }

    @IBAction func logoutAction(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
        self.logoutButton.alpha = 0.0
        self.emailField.text = ""
        self.passwordField.text = ""
    }
    
}

