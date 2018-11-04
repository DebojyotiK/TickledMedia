//
//  TMMiddleware.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

/*
 Handle Generic level network errors at this level.
 */
class TMMiddleware: Middleware {
    
    convenience init(useAuthorization:Bool=true) {
        self.init()
        if useAuthorization{
            //For Authorized WS use the JWT/OAuth token
            requestHeaders["Authorization"] = "bearer TMToken"
        }
    }
}
