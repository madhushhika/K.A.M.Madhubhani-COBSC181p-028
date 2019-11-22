//
//  MenuViewController.swift
//  NIBMArticle
//
//  Created by Isuru Devinda on 11/22/2562 BE.
//  Copyright © 2562 BE NIBM. All rights reserved.
//

import UIKit
import LocalAuthentication
class MenuViewController: UIViewController {
var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
self.window = UIWindow(frame: UIScreen.main.bounds)
        // Do any additional setup after loading the view.
    }

    
    @IBAction func viewProfile(_ sender: Any) {
        
        let authContext = LAContext()
        let authReason = "Please use Touch ID to access Your Account"
        var authError : NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &authError){
            
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: authReason, reply: { (success,error) -> Void in
                
                if error != nil{
                    DispatchQueue.main.async {
                        self.alert(message: "Authentication Failed")
                    }
                    return
                }
                
                
                if success{
                    //Go to My Account Page
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "Menu", bundle: nil)
                        
                        let initialViewController = storyboard.instantiateViewController(withIdentifier: "myProfile")
                        
                        self.window?.rootViewController = initialViewController
                        self.window?.makeKeyAndVisible()
                    }
                }
                
                
            })
            
        }
        else{
            self.alert(message: "Authentication Failed")
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
}
