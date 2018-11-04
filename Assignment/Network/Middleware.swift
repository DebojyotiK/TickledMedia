//
//  Middleware.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

/*
 Use this class for monitoring/Changing network request/Responses
 Use Case:Strip of unwanted header,send iOS Version..without hampering the actual Bussiness logic Entity
 Use Logging Libraries here while in Development
 */
class Middleware: NSObject {

    var requestHeaders:[String:String]!
    func responseHandler<T>(response:DataResponse<T>)->Error?{
        
        let _response = response.response
        if _response != nil {
            let statusCode = _response!.statusCode
            if(!(statusCode>=200 && statusCode<300)){
                
                //TODO:Return a valid error message
                return nil

            }
        }
        return response.error
    }
    
    override init() {
        requestHeaders = [:]
    }

}
