//
//  ErrorView.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

@objc protocol ErrorView {
    @objc optional var retryButton:UIView? {get set}
    @objc optional var cancelButton:UIView? {get set}
    @objc optional var error:Error? {get set}
}
