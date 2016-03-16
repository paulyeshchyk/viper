//
//  LoginWire.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class LoginWire:NSObject, WireProtocol {

    var wireType:WireType
    var wireFrame:WireFrameProtocol
    var presenter:PresenterProtocol
    var isAuthenticated:Bool = false
    var input:WireInputProtocol
    
    required init(type: WireType, wireFrame: WireFrameProtocol) {

        let loginIteractor = LoginIteractor()

        let presenter = LoginPresenter(theApp: wireFrame.appDelegate)
        let vc = LoginViewController(nibName:"LoginViewController", bundle: NSBundle.mainBundle())
        vc.presenter = presenter
        presenter.view = vc
        presenter.output = loginIteractor
        
        
        self.wireType = type
        self.wireFrame = wireFrame
        self.presenter = presenter
        self.input = presenter
        
        super.init()
        self.presenter.wire = self
    }
    
    deinit {
        
        self.presenter.wire = nil
    }
    
    func run(completionBlock:WireOpenCompletionBlock) {
     
        presenter.doPresent()
        completionBlock(wire:self)
    }
    
    func done() {
        
        
        if self.isAuthenticated {
            
            self.wireFrame.run(.ListWire, completionBlock: {(wire:WireProtocol) in
            })
        }
        
    }
    
}
