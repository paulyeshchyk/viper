//
//  Protocols.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

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
    
    init(theApp:TheAppProtocol)
    var wire:WireProtocol? {get set}
    var vc:UIViewController? {get}
    func doPresent()
}

protocol InteractorProtocol {
    
}

typealias WireOpenCompletionBlock = (wire:WireProtocol) -> ()

protocol WireProtocol {
    
    var wireFrame:WireFrameProtocol {get set}
    var wireType:WireType {get set}
    var input:WireInputProtocol {get set}
    
    init(type:WireType, wireFrame:WireFrameProtocol)
    
    func run(completionBlock:WireOpenCompletionBlock)
    func done()
}


protocol WireFrameProtocol {
 
    var appDelegate:TheAppProtocol {get set}
    init(app:TheAppProtocol)
    
    func run(type:WireType, completionBlock:WireOpenCompletionBlock)
}