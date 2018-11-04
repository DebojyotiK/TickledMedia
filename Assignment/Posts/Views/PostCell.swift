//
//  PostCell.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postDescriptionView: PostDescriptionView!
    
    func setData(post:UserPostEntity) {
        postDescriptionView.setData(post: post)
    }
}
