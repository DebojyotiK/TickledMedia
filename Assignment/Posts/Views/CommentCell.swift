//
//  CommentCell.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 05/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCommentData(_ comment:CommentEntity)  {
        commentLabel.text = comment.message
    }

}
