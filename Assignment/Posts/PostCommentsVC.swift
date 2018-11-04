//
//  PostCommentsVC.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

class PostCommentsVC: BaseViewController {

    @IBOutlet private weak var countLabel: UILabel!
    var viewModel:PostViewModel?
    var post:UserPostEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVC()
    }
    
    func initializeVC()  {
        countLabel.text = "\(String(describing: (post?.comments?.count)!))"
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension PostCommentsVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentComment = (post?.comments![indexPath.row])!
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell") as! CommentCell
        cell.setCommentData(currentComment)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

