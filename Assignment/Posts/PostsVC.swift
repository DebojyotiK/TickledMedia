//
//  PostsVC.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

class PostsVC: BaseViewController {

    @IBOutlet weak var navigationBar: TMNavigationBar!
    @IBOutlet weak var contentView: ContainerView!
    @IBOutlet weak var postsTableView: UITableView!
    var viewModel:PostViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVC()
    }
    
    func initializeVC()  {

        self.setNavigationBar(navigationBar)
        let contentErrorView:NetworkErrorView = .fromNib()
        contentView.errorView = contentErrorView
        contentView.willShowContent = {
            self.postsTableView.reloadData()
        }
        viewModel?.postsListPage = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.getPostsForNextPage()
    }
}

extension PostsVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostCell
        cell.setData(post: (viewModel?.posts![indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
