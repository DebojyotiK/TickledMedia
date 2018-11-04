//
//  UIViewUtilities.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import Foundation
import UIKit

//Some Utility functions to design views in Xibs and then reusing them
extension UIView {
    
    func embed(view:UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(view)
        let topConstraint = NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint.init(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        let leftConstraint = NSLayoutConstraint.init(item: self, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint.init(item: self, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        
        self.addConstraints([topConstraint,leftConstraint,bottomConstraint,rightConstraint])
    }

    public func initWith(bundle:Bundle?=Bundle.main,nibName:String,index:Int) -> UIView{
        
        if subviews.count == 0 {
            let loadedViews = bundle!.loadNibNamed(nibName, owner: nil, options: nil)
            let loadedView = loadedViews?[index] as? UIView
            loadedView?.tintColor = self.tintColor
            loadedView?.frame = frame
            loadedView?.autoresizingMask = autoresizingMask
            loadedView?.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
            loadedView?.isUserInteractionEnabled = isUserInteractionEnabled
            for constraint: NSLayoutConstraint in constraints {
                var firstItem = constraint.firstItem as? UIView
                if firstItem == self {
                    firstItem = loadedView
                }
                var secondItem = constraint.secondItem as? UIView
                if secondItem == self {
                    secondItem = loadedView
                }
                
                let newLayoutConstraint = NSLayoutConstraint(item: firstItem!, attribute: constraint.firstAttribute, relatedBy: constraint.relation, toItem: secondItem, attribute: constraint.secondAttribute, multiplier: constraint.multiplier, constant: constraint.constant)
                newLayoutConstraint.priority = constraint.priority
                loadedView?.addConstraint(newLayoutConstraint)
            }
            return loadedView!
        }
        return self
    }
    
    class func fromNib<T: UIView>(index:Int=0) -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![index] as! T
    }
    
}

//A Autolayout utility to programatically assign constraints
extension UIView{

    @discardableResult
    func setConstantWidth(width: CGFloat, priority:Int=1000) -> NSLayoutConstraint? {

        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width)
        constraint.priority = UILayoutPriority(rawValue: UILayoutPriority.RawValue(priority))
        addConstraint(constraint)
        return constraint
    }

    @discardableResult
    func setConstantHeight(height: CGFloat, priority:Int=1000) -> NSLayoutConstraint? {

        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
        constraint.priority = UILayoutPriority(rawValue: UILayoutPriority.RawValue(priority))
        addConstraint(constraint)
        return constraint
    }

}
