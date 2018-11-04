//
//  PostsVC.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

class PostsVC: BaseViewController {

    @IBOutlet weak var navigationBar: NavigationBarDefault!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVC()
    }
    
    func initializeVC()  {
        self.setNavigationBar(navigationBar)
    }
}
