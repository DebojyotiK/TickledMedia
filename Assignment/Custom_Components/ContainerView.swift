//
//  ContainerView.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

enum ContainerState {
    case ShowLoader
    case ShowError
    case ShowContent
}

class ContainerView: UIView {

    private var block: DispatchWorkItem?
    private var contentView:UIView?
    private var placeholderView = PlaceholderView.init(frame: CGRect.zero)
    var loaderView:UIView?
    var errorView:UIView?
    var state:ContainerState = .ShowContent{
        didSet{
            
            if state == .ShowContent {
                //Cancel any previous delayed block call otherwise the block will be unneccessarily executed
                self.block?.cancel()
                willShowContent?()
                self.setNeedsDisplay()
            }
            else if (state == .ShowLoader){
                willShowLoader?()
                self.setNeedsDisplay()
                //Cancel any previous delayed block call otherwise the block will be unneccessarily executed
                self.block?.cancel()
            }
            else{
                
                if oldValue == .ShowLoader{
                    
                    self.block?.cancel()
                    self.block = DispatchWorkItem.init(block: {
                        self.setNeedsDisplay()
                    })
                    //A Delay of 2 Seconds has been purposefully put to avoid flickering effect between showLoader and ShowError state
                    //This happens during network calls which give quick error callbacks(No Internet Connection)
                    //However this delay is useless when there is considerable delay in network requests
                    
                    //A better approach can be to store the last time stamp and if the delay is considerably small then add a delay manuall else leave it as it is
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: block!)
                    
                }
                else if oldValue == .ShowContent{
                    self.block?.cancel()
                    self.setNeedsDisplay()
                }

            }
            
        }
    }
    
    var willShowContent:(()->())?
    var willShowLoader:(()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView = self.subviews.first
        self.embed(view: placeholderView)
        self.bringSubviewToFront(placeholderView)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        switch state {
        case .ShowContent:
            placeholderView.isHidden = true
            placeholderView.view = nil
        case .ShowLoader:
            placeholderView.isHidden = false
            placeholderView.view = loaderView
        default:
            placeholderView.isHidden = false
            placeholderView.view = errorView
        }
        contentView?.isHidden = !placeholderView.isHidden
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        self.block?.cancel()
    }
}
