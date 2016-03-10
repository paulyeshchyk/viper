//
//  RootProtocols.swift
//  CleanSwiftApp
//
//  Created by Pavel Yeshchyk on 3/10/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import Foundation

protocol RootControllerProtocol {
    
    var router:RootRouterProtocol? {get set}
    var output:RootIteractorProtocol? {get set}
    
    func displayData(data:[String])
}

protocol RootConfiguratorProtocol {
    
    func configure(controller:RootControllerProtocol)
}

protocol RootRouterProtocol {
    
    var viewController:RootControllerProtocol? {get set}
    func openRootDetail(data:String)
}

protocol RootPresenterProtocol {
    
    var output:RootControllerProtocol? {get set}
    
    func parseResponse()
}

protocol RootIteractorProtocol {
    
    var output:RootPresenterProtocol? {get set}
    
    func fetchData()
}