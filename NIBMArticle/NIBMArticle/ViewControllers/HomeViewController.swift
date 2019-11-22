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


class HomeViewController: UIViewController {var postsList : [ArticleModel] = []
    var ref: DatabaseReference!
    var window: UIWindow?
    
    @IBOutlet weak var tableview: UITableView!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
      //  tableview.dataSource = self
     //   tableview.delegate = self
        
      //  getStudentDetails()
        
        // Do any additional setup after loading the view.
    }
    func getStudentDetails(){
        
        let friendsRef = ref.child("Article")
        
        
        friendsRef.observe(.value){ snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                
                let studentDictonary = child.value as! NSDictionary
                
                let title = studentDictonary["Title"] as! String
                let description = studentDictonary["Description"] as! String
                let user = studentDictonary["PublisherName"] as! String
                let image_url = studentDictonary["imageUrl"] as! String
                
                let articleSet = ArticleModel(
                    title: title,
                    description: description,
                    user: user ,
                    image_url: image_url
                )
                
                self.postsList.append(articleSet)
                
                print(child)
            }
            
            self.tableview.reloadData()
            
            
        }
     }
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! article
        
        cell.selectionStyle = .none
        
        cell.populateData(articleSet: postsList[indexPath.row])
        
        return cell
    }
    
    
 
}


