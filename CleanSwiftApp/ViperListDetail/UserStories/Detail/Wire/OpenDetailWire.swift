//
//  DetailWire.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/15/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class OpenDetailWire: NSObject, WireProtocol {

    var wireType:WireType
    var wireFrame:WireFrameProtocol
    var presenter:PresenterProtocol?
    var input:WireInputProtocol?
    
    required init(type:WireType, wireFrame:WireFrameProtocol) {

        self.wireType = type
        self.wireFrame = wireFrame
        super.init()

        let interactor = OpenDetailIteractor()
        
        let presenter = OpenDetailPresenter(wire: self)
        
        let vc = DetailViewController(nibName:"DetailViewController", bundle: NSBundle.mainBundle())
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        interactor.presenter = presenter

        self.presenter = presenter
        self.input = presenter


        presenter.openRouteCallback = {(presenter,routeResultCallback) in
            
            self.wireFrame.push(presenter)
        }
        presenter.updateRouteCallback = {(presenter, routeResultCallback) in

            self.wireFrame.pop()
        }
    }
    
    func run(completionBlock:WireOpenCompletionBlock) {
        
        presenter?.doPresent()
        
        completionBlock(wire:self)
    }
}
