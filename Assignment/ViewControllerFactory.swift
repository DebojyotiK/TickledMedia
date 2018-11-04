//
//  ViewControllerFactory.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

class ViewControllerFactory: NSObject {
    
    private static var Posts = UIStoryboard.init(name: "Posts", bundle: nil)
    
    class func postsVC() -> PostsVC{
        return Posts.instantiateViewController(withIdentifier: "postsVC") as! PostsVC
    }
    
    class func postCommentsVC() -> PostCommentsVC{
        return Posts.instantiateViewController(withIdentifier: "postCommentsVC") as! PostCommentsVC
    }
}
