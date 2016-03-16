//
//  AppDelegate+Windows.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/16/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

extension AppDelegate: TheAppProtocol {
    
    //MARK: - private
    
    func findOrCreateWindow() -> UIWindow {
        
        if let window = self.window {
            
            return window
        } else {
            
            let window = UIWindow(frame: UIScreen.mainScreen().bounds)
            self.window = window
            return window
        }
    }
    
    func findOrCreateNavigationControllerAndPushPresenter(presenter: PresenterProtocol) {
        
        guard let vc = presenter.vc else {
            
            print("vc not found")
            return
        }
        
        let window = self.findOrCreateWindow()
        guard let nc = window.rootViewController as? UINavigationController else {
            
            let navController = UINavigationController(rootViewController: vc)
            window.rootViewController = navController
            window.makeKeyAndVisible()
            return
        }
        
        nc.pushViewController(vc, animated: true)
    }
    
    
    func findNavigationControllerPopPresented() {
        
        let window = self.findOrCreateWindow()
        guard let nc = window.rootViewController as? UINavigationController else {
            
            return
        }
        
        nc.popViewControllerAnimated(true)
    }
    
    func setRootPresenter(presenter:PresenterProtocol) {
        
        guard let vc = presenter.vc else {
            
            print("vc not found")
            return
        }
        
        let window = self.findOrCreateWindow()
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }

}