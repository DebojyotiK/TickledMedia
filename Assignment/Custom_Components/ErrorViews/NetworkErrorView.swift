//
//  ErrorView.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

class NetworkErrorView: UIView,ErrorView {
    
    var retryAction:(()->())?
    var error:Error?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func tryAgainAction(_ sender: UIControl) {
        retryAction?()
    }
    
}
