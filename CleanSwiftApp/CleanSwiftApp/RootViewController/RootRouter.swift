//
//  RootRouter.swift
//  CleanSwiftApp
//
//  Created by Pavel Yeshchyk on 3/10/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class RootRouter: RootRouterProtocol {
    
    var viewController:RootControllerProtocol?
    
    func openRootDetail(data: String) {

        if let vc = UIApplication.sharedApplication().keyWindow?.rootViewController as? UINavigationController {
        
            let detail:DetailViewController = DetailViewController(nibName:"DetailViewController", bundle: NSBundle.mainBundle())
            vc.pushViewController(detail, animated: true)
        }
        
    }
}
