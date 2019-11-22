//
//  ResetPasswordViewController.swift
//  NIBMArticle
//
//  Created by MacBook on 11/22/19.
//  Copyright © 2019 NIBM. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var submit_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submit_btn.layer.cornerRadius = 8
    }
    

    @IBAction func submit_btn_click(_ sender: Any) {
        
        if username.text == "" {
            self.alert(message: "Enter your email")
            return
        }
        
        if !isValidEmail(testStr: username.text!) {
            self.alert(message: "Not a valid email")
            return
        }
        //Firebase email verification and send password to email
        
        Auth.auth().sendPasswordReset(withEmail: username.text!) { error in
            if (error != nil){
                self.alert(message: error?.localizedDescription ?? "Error")
                return
            }
            
            self.alert(message: "A password reset email has been sent to your account")
            
            
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
