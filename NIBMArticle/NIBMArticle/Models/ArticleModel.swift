//
//  ArticleModel.swift
//  NIBMArticle
//
//  Created by Madhushika on 11/18/19.
//  Copyright © 2019 NIBM. All rights reserved.
//

import Foundation
struct Article:Codable  {
    
    var publisherName:String!
    var title : String!
    var description : String!
    var postedImage :String!
    
    init(title: String, description: String, addedTime: Date ,postImage:String,publisherName:String) {
        self.publisherName=publisherName
        self.title = title
        self.description = description
        self.postedImage = postedImage
        
    }
}
