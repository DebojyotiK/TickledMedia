//
//  ErrorView.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

@objc protocol ErrorView {
    @objc optional var retryAction:(()->())? {get set}
    @objc optional var cancelAction:(()->())? {get set}
    @objc optional var error:Error? {get set}
}
