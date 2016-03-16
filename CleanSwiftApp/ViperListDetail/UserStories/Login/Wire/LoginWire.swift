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
    var presenter:PresenterProtocol?
    var input:WireInputProtocol?
    
    required init(type: WireType, wireFrame: WireFrameProtocol) {


        self.wireType = type
        self.wireFrame = wireFrame

        super.init()
        
        let interactor = LoginInteractor()

        let presenter = LoginPresenter(wire: self)
        let vc = LoginViewController(nibName:"LoginViewController", bundle: NSBundle.mainBundle())
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor

        self.presenter = presenter
        self.input = presenter

        presenter.openRouteCallback = {(presenter, routeResultCallback) in

            self.wireFrame.push(presenter)
        }
        
        presenter.authSuccessRouteCallback = {(presenter, routeResultCallback) in

            self.wireFrame.run(.ListWire, completionBlock: routeResultCallback)
        }
        presenter.authFailRouteCallback = {(presenter, routeResultCallback) in
            
        }
    }
    
    func run(completionBlock:WireOpenCompletionBlock) {
     
        presenter?.doPresent()
        completionBlock(wire:self)
    }
}
