//
//  UserPostEntity.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit
import ObjectMapper

class UserPostEntity: NSObject,Mappable {
    
    private(set) var resourceId:Int!
    private(set) var userId:Int!
    private(set) var message:String?
    private(set) var image:String?
    private(set) var comments:[CommentEntity]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        resourceId <- map["id"]
        userId <- map["user_id"]
        message <- map["message"]
        image <- map["image"]
        comments <- map["comments"]
    }
    

}
