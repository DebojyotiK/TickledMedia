//
//  Loader.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import Foundation

@objc protocol Loader {
    @objc optional func showLoader()
    @objc optional func hideLoader()
}
