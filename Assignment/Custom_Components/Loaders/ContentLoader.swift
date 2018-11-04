//
//  ContentLoader.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 05/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

class ContentLoader: UIView,Loader {
    
    @IBOutlet weak var loadingImageView: UIImageView!
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setupAnimation()
    }
    
    // MARK: - Setup Layers
    private func setupAnimation()
    {
        let imageLayer = loadingImageView.layer
        let transformRotationZAnimation = CASpringAnimation()
        transformRotationZAnimation.beginTime = 0.000001
        transformRotationZAnimation.duration = 0.99321
        transformRotationZAnimation.repeatCount = .infinity
        transformRotationZAnimation.fillMode = CAMediaTimingFillMode.forwards
        transformRotationZAnimation.isRemovedOnCompletion = false
        transformRotationZAnimation.keyPath = "transform.rotation.z"
        transformRotationZAnimation.toValue = 3.141592653589793
        transformRotationZAnimation.fromValue = 0
        transformRotationZAnimation.stiffness = 200
        transformRotationZAnimation.damping = 10
        transformRotationZAnimation.mass = 0.7
        transformRotationZAnimation.initialVelocity = 4
        imageLayer.add(transformRotationZAnimation, forKey: "transformRotationZAnimation")
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        loadingImageView.layer.removeAllAnimations()
    }
    
}
