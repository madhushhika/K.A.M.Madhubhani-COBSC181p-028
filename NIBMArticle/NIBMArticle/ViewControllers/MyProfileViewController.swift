//
//  MyProfileViewController.swift
//  NIBMArticle
//
//  Created by MacBook on 11/22/19.
//  Copyright © 2019 NIBM. All rights reserved.
//

import UIKit
import Firebase

class MyProfileViewController: UIViewController {
var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
          self.window = UIWindow(frame: UIScreen.main.bounds)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func LogOut_btnClick(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
         
            try firebaseAuth.signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "LoginSB")
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
       
        
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
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
