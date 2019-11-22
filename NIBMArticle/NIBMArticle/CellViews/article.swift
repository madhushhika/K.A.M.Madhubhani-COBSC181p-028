//
//  PostCell.swift
//  NIBM Article
//
//  Created by Isuru Devinda on 11/20/2562 BE.
//  Copyright © 2562 BE Isuru Devinda. All rights reserved.
//


import UIKit
import Nuke

class article: UITableViewCell {
    
    @IBOutlet weak var postName: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func populateData(articleSet: ArticleModel)  {
        postTitle.text = articleSet.title
        postDescription.text = articleSet.description
        postName.text = articleSet.user
        
        let imgUrl = URL(string: articleSet.image_url)
        
        Nuke.loadImage(with: imgUrl!, into: postImage)
        
    }
    
  /*  func populateData(article: ArticleModel)  {
        
        postTitle.text = article.title
        postDescription.text = article.description
        userName.text = article.user
        
        let imgUrl = URL(string: article.image_url)
        
        Nuke.loadImage(with: imgUrl!, into: postImage)
        
    }*/
    
}
