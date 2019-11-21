//
//  CreatePostViewController.swift
//  NIBMArticle
//
//  Created by Madhushika on 11/20/19.
//  Copyright © 2019 NIBM. All rights reserved.
//

import UIKit
import Firebase

class CreatePostViewController: UIViewController {

    @IBOutlet weak var articleTitle: UITextField!   //article Tile
    @IBOutlet weak var article_User: UITextField!   //Publier's Name
    @IBOutlet weak var article_Des: UITextField!    // Article Description
    @IBOutlet weak var article_image: UIImageView!  //Image
    var imagePicker:UIImagePickerController!
    var ref = DatabaseReference.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        self.ref = Database.database().reference()
        
        article_image.isUserInteractionEnabled = true
    }
    /* ---------------Image Upload Method------------------*/
    @IBAction func uploadImage_Btn(_ sender: Any) {
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
   /* ---------------Article Share Method------------------*/
    @IBAction func AddNewArticle_btn(_ sender: Any) {
        if (articleTitle.text == "") {
            alert(message: "Title is required")
            return
        }
        
        if (article_Des.text == ""){
            alert(message: "Description is Required")
            return
        }
        if (article_image.image == nil){
            alert(message: "Please upload the Image")
            return
        }
        self.saveToDatabase()   //call method to save data
        navigationController?.popViewController(animated: true)
        
    }
    /*----------------------Get uploaded Image ----------------*/
    func saveToDatabase(){
        
        self.uploadMedia(image: article_image.image!){ url in
            self.saveImage(profileImageURL: url!){ success in
                if (success != nil){
                    self.dismiss(animated: true, completion: nil)
                }
                
            }
        }
    }
    /*-----------        Upload Image Data   ----------*/
    func uploadMedia(image :UIImage, completion: @escaping ((_ url: URL?) -> ())) {
        let imageName = UUID().uuidString
        let storageRef = Storage.storage().reference().child("Article").child(imageName)
        let imgData = self.article_image.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storageRef.putData(imgData!, metadata: metaData) { (metadata, error) in
            if error == nil{
                storageRef.downloadURL(completion: { (url, error) in
                    completion(url)
                })
            }else{
                print("error in save image")
                completion(nil)
            }
        }
    }
    
    /*    ----------  Save Image data and Article data to Article Collection -------      */
    func saveImage(profileImageURL: URL , completion: @escaping ((_ url: URL?) -> ())){
        let result = ["Description": article_Des.text!, "imageUrl": profileImageURL.absoluteString,"Title": articleTitle.text!,"PublierName": article_User.text!] as [String : Any]
        self.ref.child("Article").childByAutoId().setValue(result)
    }
    
}

    // self.present(imagePicker, animated: true, completion: nil)
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


