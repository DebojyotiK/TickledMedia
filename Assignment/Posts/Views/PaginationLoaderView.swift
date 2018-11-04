//
//  PaginationLoaderView.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 05/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

class PaginationLoaderView: UIView,Loader {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setupAnimation()
    }
    
    func showLoader() {
        self.isHidden = false
        setupAnimation()
    }
    
    func hideLoader() {
        layer.removeAllAnimations()
        self.isHidden = true
    }
    
    // MARK: - Setup Layers
    private func setupAnimation()
    {
        let color = UIColor(red: 1, green: 0.075196, blue: 0.471848, alpha: 1)
        let backgroundColorAnimation = CABasicAnimation()
        backgroundColorAnimation.beginTime = 0.000001
        backgroundColorAnimation.duration = 0.5
        backgroundColorAnimation.repeatCount = .infinity
        backgroundColorAnimation.autoreverses = true
        backgroundColorAnimation.fillMode = CAMediaTimingFillMode.both
        backgroundColorAnimation.isRemovedOnCompletion = false
        backgroundColorAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        backgroundColorAnimation.keyPath = "backgroundColor"
        backgroundColorAnimation.toValue = color.cgColor
        layer.add(backgroundColorAnimation, forKey: "backgroundColorAnimation")

    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        layer.removeAllAnimations()
    }
}
