//
//  PlaceholderView.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

/*
 A view for embedding any content at runtime
 This Container will remove any previous view when a new view has been installed.
 This view has no intrinsic content size and hence it dependent solely on the view that is embedded in it or any constraints given manually to it
 */
class PlaceholderView: UIView {

    private var installedView:UIView?
    
    var view:UIView?{
        didSet{
            if(installedView != nil){
                if(installedView!.superview != nil){
                    installedView!.removeFromSuperview()
                }
            }
            if view != nil {
                embed(view: view!)
            }
            installedView = view
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //If no view is installed default height should be 0
        self.setConstantHeight(height: 0,priority: 100)
        self.backgroundColor = UIColor.clear
    }
}
