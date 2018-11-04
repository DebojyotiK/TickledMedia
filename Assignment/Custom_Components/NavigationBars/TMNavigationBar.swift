//
//  TMNavigationBar.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

@IBDesignable
class NavigationBarDefault: UIView,NavigationBar {
    
    
    var backButton: UIControl{
        get{
            return _backButton
        }
    }
    
    @IBOutlet private var navigationBarContainer: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var _backButton: UIControl!
    @IBOutlet private weak var backImageView: UIImageView!
    private let barThemeColor = UIColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    
    @IBInspectable
    var title:String?{
        didSet{
            #if TARGET_INTERFACE_BUILDER
            #else
            if(title != nil){
                titleLabel.text = title
            }
            else{
                titleLabel.text = ""
            }
            #endif
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backImageView.tintColor = barThemeColor
        titleLabel.tintColor = barThemeColor
        navigationBarContainer.setConstantHeight(height: 44.0)
    }
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        return initWith(bundle: Bundle.main, nibName: "TMNavigatonBar", index: 0)
    }
}

