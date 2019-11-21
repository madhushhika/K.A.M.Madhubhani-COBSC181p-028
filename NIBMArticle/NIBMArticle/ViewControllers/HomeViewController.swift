//
//  HomeViewController.swift
//  NIBMArticle
//
//  Created by MacBook on 11/21/19.
//  Copyright © 2019 NIBM. All rights reserved.
//

import UIKit
import Firebase
import LocalAuthentication


    class HomeViewController: UITableViewController {
        
    @IBOutlet weak var LooOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      }
    
        @IBAction func logOut_btn(_ sender: Any) {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        
        }
        /*  @IBAction func logout(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }*/
    
    
 
}
