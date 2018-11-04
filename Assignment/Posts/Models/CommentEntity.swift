//
//  CommentEntity.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit
import ObjectMapper

class CommentEntity: NSObject,Mappable {

    var message:String?
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        message <- map["message"]
    }
}
