//
//  Wrapper.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

typealias RetryHandler = (()->DataRequest)

class Wrapper: NSObject {
    
    private var _baseURL:URL!
    private var _manager:SessionManager!
    var value:Int!
    
    convenience init(baseURL:String!) {
        self.init()
        _baseURL = URL.init(string: baseURL);
        _manager = SessionManager()
    }
    
    @discardableResult
    func GET<T>(relURL:String,
                queryParams:[String:Any]?=nil,
                onSuccess:((DataResponse<T>)->())?,
                onFailure:((NSError?)->())?=nil,
                middleware:Middleware? = Middleware()) -> DataRequest where T:BaseMappable{
        
        let url = URL.init(string: relURL, relativeTo: _baseURL)
        let request = _manager.request(url!, method: HTTPMethod.get, parameters: queryParams, encoding: JSONEncoding.default, headers:middleware?.requestHeaders)
        request.responseObject { (response:DataResponse<T>) in
            let error = middleware?.responseHandler(response: response)
            if(error == nil){
                onSuccess?(response)
            }
            else{
                onFailure?(error as NSError?)
            }
        }
        return request
    }
    
    @discardableResult
    func GET(relURL:String,
             queryParams:[String:Any]?=nil,
             onSuccess:((DataResponse<Data>)->())?,
             onFailure:((NSError?)->())?=nil,
             middleware:Middleware? = Middleware()) -> DataRequest{
        
        let url = URL.init(string: relURL, relativeTo: _baseURL)
        let request = _manager.request(url!, method: HTTPMethod.get, parameters: queryParams, encoding: JSONEncoding.default, headers:middleware?.requestHeaders)
        request.responseData { (response:DataResponse<Data>) in
            let error = middleware?.responseHandler(response: response)
            if(error == nil){
                onSuccess?(response)
            }
            else{
                onFailure?(error as NSError?)
            }
        }
        return request
    }
    
}
