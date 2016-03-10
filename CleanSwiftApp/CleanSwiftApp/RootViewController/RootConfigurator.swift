//
//  RootViewControllerConfigurator.swift
//  CleanSwiftApp
//
//  Created by Pavel Yeshchyk on 3/10/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class RootConfigurator: NSObject, RootConfiguratorProtocol {

    class var sharedInstance:RootConfigurator? {
        
        struct Static {
            static var instance: RootConfigurator?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            
            Static.instance = RootConfigurator()
        }
        
        return Static.instance
    }
    
    
    func configure(var controller:RootControllerProtocol) {
     
        let router = RootRouter()
        router.viewController = controller
        
        let presenter = RootPresenter()
        presenter.output = controller
        
        let iterator = RootIteractor()
        iterator.output = presenter
        
        
        controller.router = router
        controller.output = iterator
    }
}
