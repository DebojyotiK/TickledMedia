//
//  PostViewModel.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class PostViewModel: NSObject {

    private(set) var posts:[UserPostEntity]?
    private var wrapper = Wrappers.TickledMedia()
    private var isPostFetchingInProgress:Bool = false
    private var postFetchRequest:DataRequest?
    weak var postsListPage:PostsVC?
    weak var postCommentsPage:PostCommentsVC?
    
    func getPostsForNextPage()  {
        
        if isPostFetchingInProgress == false{
            //If there are no posts in the table show the content loader.
            //Else show the bottom Loader
            if posts == nil || posts?.count == 0 {
                postsListPage?.contentView.state = .ShowLoader
            }
            else{
                
            }
            postFetchRequest = wrapper.GET(relURL: WSEndpoints.Post_Resources.posts,
                                           queryParams: nil,
                                           onSuccess: { (response:DataResponse<Data>) in
                                            
                                            do{
                                                try self.mapPosts(response: response)
                                                self.isPostFetchingInProgress = false
                                                self.postsListPage?.contentView.state = .ShowContent
                                            }
                                            catch{
                                                
                                                self.showCouldNotFetchPostError()
                                            }
                                            
            }, onFailure: { (error) in
                
                self.showCouldNotFetchPostError()
                
            }, middleware: TMMiddleware.init(useAuthorization: false))
        }
        
    }
    
    private func showCouldNotFetchPostError(){
        
        self.isPostFetchingInProgress = false
        if self.posts != nil || self.posts?.count == 0 {
            self.postsListPage?.contentView.state = .ShowError
        }
        else{
            //TODO:Show Failure
        }
    }
    
    func cancelPostFetching() {
        postFetchRequest?.cancel()
    }
    
    func showCommentsForPost(_ post:UserPostEntity) {
        let postCommentsVC = ViewControllerFactory.postCommentsVC()
        postCommentsVC.viewModel = self
        self.postsListPage?.present(postCommentsVC, animated: true, completion: nil)
    }
    
}

extension PostViewModel{
    
    fileprivate func mapPosts(response:DataResponse<Data>) throws {
        
        let responseJson = try JSONSerialization.jsonObject(with: response.data!, options: []) as! [String:Any]
        let posts = responseJson["response"] as! [[String:Any]]
        var tempPostObjects:[UserPostEntity] = []
        posts.forEach { (currentPost) in
            tempPostObjects.append(Mapper<UserPostEntity>().map(JSONObject:currentPost)!)
        }
        if self.posts == nil {
            self.posts = []
        }
        self.posts?.append(contentsOf: tempPostObjects)
    }
}
