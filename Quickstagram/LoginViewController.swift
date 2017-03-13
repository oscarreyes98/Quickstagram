//
//  LoginViewController.swift
//  Quickstagram
//
//  Created by Oscar Reyes on 3/8/17.
//  Copyright © 2017 Oscar Reyes. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if user != nil{
                print("Logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
            // check if user is logged in.
        if PFUser.current() != nil {
            // if there is a logged in user then load the home view controller
            self.performSegue(withIdentifier: "loginSegue", sender: nil)

        }
        
        return true
    }

    @IBAction func onSignUp(_ sender: Any) {
        
        let newUser = PFUser()
        newUser.username = self.usernameField.text
        newUser.password = self.passwordField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success{
                print("user created")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            } else{
                print(error?.localizedDescription as Any)
                
            }
        }
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
