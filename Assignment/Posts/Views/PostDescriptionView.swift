//
//  PostDescriptionView.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

class PostDescriptionView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        styleView()
    }
    
    func styleView() {
        
        let viewToEmbed = Bundle.main.loadNibNamed("PostDescriptionView", owner: self, options: nil)![0] as! UIView
        viewToEmbed.backgroundColor = UIColor.white
        viewToEmbed.layer.cornerRadius = 4.0
        self.layer.shadowColor = UIColor.init(red: 0.0, green: 0.18, blue: 0.55, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 7)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 10
        self.embed(view: viewToEmbed)
    }
    
    func setData(post:UserPostEntity) {
    }
}
