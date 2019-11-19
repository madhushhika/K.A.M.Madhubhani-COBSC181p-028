
//  StudentModel.swift
//  NIBMArticle
//  Created by Madhushika on 11/18/19.
//  Copyright © 2019 NIBM. All rights reserved.



import Foundation

struct  Student{
    
    var first_Name: String
    var last_Name: String
    var birthdate: String?
    var imageUrl: String
    var facebookUrl: String?
    var phoneNumber: String?
    
    
    init(first_Name: String, last_Name: String, birthdate: String?, imgUrl: String, fbUrl: String?, phoneNumber: String?) {
        self.first_Name = first_Name
        self.last_Name = last_Name
        self.birthdate = birthdate
        self.imageUrl = imgUrl
        self.facebookUrl = fbUrl
        self.phoneNumber = phoneNumber
    }
}
