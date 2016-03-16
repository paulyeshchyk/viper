//
//  Protocols.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

typealias RouteResultCallback = (wire:WireProtocol)->()
typealias RouteCallback = (presenter:PresenterProtocol, callback:RouteResultCallback) -> ()
typealias WireOpenCompletionBlock = (wire:WireProtocol) -> ()


protocol TheAppProtocol {
    
    func setRootPresenter(presenter:PresenterProtocol)
    func findOrCreateWindow() -> UIWindow
    func findOrCreateNavigationControllerAndPushPresenter(presenter:PresenterProtocol)
    func findNavigationControllerPopPresented()
}

protocol ViewProtocol {

}

protocol RouterProtocol {
    
}

protocol WireInputProtocol {
    
}

protocol PresenterProtocol {
    
    init(wire:WireProtocol)
    var wire:WireProtocol {get set}
    var vc:UIViewController? {get}
    func doPresent()
}

protocol InteractorProtocol {
    
}

protocol WireProtocol {
    
    var wireFrame:WireFrameProtocol {get set}
    var wireType:WireType {get set}
    var input:WireInputProtocol? {get set}
    var presenter:PresenterProtocol? {get set}
    
    init(type:WireType, wireFrame:WireFrameProtocol)
    
    func run(completionBlock:WireOpenCompletionBlock)
}

protocol WireFrameProtocol {
 
    init(app:TheAppProtocol)
    
    func run(type:WireType, completionBlock:WireOpenCompletionBlock)
    
    func push(presenter:PresenterProtocol)
    func pop()
    func makeRootPresenter(presenter:PresenterProtocol)
}