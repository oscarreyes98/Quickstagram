//
//  LogoutViewController.swift
//  Quickstagram
//
//  Created by Oscar Reyes on 3/11/17.
//  Copyright © 2017 Oscar Reyes. All rights reserved.
//

import UIKit
import Parse

class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            print("Logged out")
            self.performSegue(withIdentifier: "returnToLoginSegue", sender: nil)
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
