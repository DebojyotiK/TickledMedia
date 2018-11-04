//
//  BaseViewController.swift
//  Assignment
//
//  Created by Debojyoti Karmakar on 04/11/18.
//  Copyright © 2018 Independent. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    private var _navigationBar:NavigationBar?
    private var _handleNavigationBar:Bool!
    var willPopViewController:(()->Bool)?
    private var tapGestureRecognizer:UITapGestureRecognizer?
    
    func setNavigationBar(_ navigationBar:NavigationBar,handleNavigationBar:Bool=true) {
        _navigationBar = navigationBar
        _handleNavigationBar = handleNavigationBar
        if navigationController != nil{
            _navigationBar?.backButton?.isHidden =  ((self.navigationController?.viewControllers.count)! <= 1)
        }
        else{
            _navigationBar?.backButton?.isHidden = true
        }
        
        self.initializeVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(_tapped(_:)))
        tapGestureRecognizer?.delegate = self
    }
    
    private func initializeVC() {
        
        if(self._navigationBar?.backButton != nil){
            self._navigationBar?.backButton!.addTarget(self, action: #selector(self.pageBackAction), for: UIControl.Event.touchUpInside)
        }
    }
    
    @objc private func pageBackAction() {
        if _handleNavigationBar {
            
            let shouldPop = self.willPopViewController != nil ? self.willPopViewController!() : true
            if shouldPop {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    //MARK: View Controller Delegates
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addAllObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        removeAllObservers()
    }
    
    //MARK: Notification Observers
    fileprivate func addAllObservers() {
        registerKeyboardNotifications()
    }
    
    fileprivate func removeAllObservers() {
        deRegisterKeyboardNotifications()
    }
    
    @objc private func _tapped(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
    }
}

extension BaseViewController:UIGestureRecognizerDelegate{
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        //If the touched view is a UIControl let it receive touch
        if touch.view is UIControl {
            return false
        }
        return true
    }
    
    //MARK: - Keyboard notification observer Methods
    fileprivate func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self._keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self._keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    fileprivate func deRegisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc private func _keyboardWillShow(notification: NSNotification) {
        self.view.addGestureRecognizer(self.tapGestureRecognizer!)
    }
    
    @objc private func _keyboardWillHide(notification: NSNotification) {
        self.view.removeGestureRecognizer(self.tapGestureRecognizer!)
    }
    
}
