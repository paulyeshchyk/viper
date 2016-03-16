//
//  ListWire.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListWire: NSObject, WireProtocol {

    var wireType:WireType
    var wireFrame:WireFrameProtocol
    var presenter:PresenterProtocol?
    var input:WireInputProtocol?
    
    required init(type:WireType, wireFrame:WireFrameProtocol) {

        self.wireType = type
        self.wireFrame = wireFrame

        super.init()
        
        let interactor = ListInteractor()
        
        let presenter = ListPresenter(wire: self)
        
        let vc = ListViewController(nibName:"ListViewController", bundle: NSBundle.mainBundle())
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        self.presenter = presenter
        self.input = presenter
        
        presenter.openListRoute = {(presenter, routeResultCallback) in
            
            self.wireFrame.makeRootPresenter(presenter)
        }
        
        presenter.addItemRoute = {(presenter, routeResultCallback) in

            self.wireFrame.run(.AddDetailWire, completionBlock: routeResultCallback)
        }
        
        presenter.openDetailRoute = {(presenter, routeResultCallback) in
            
            self.wireFrame.run(.OpenDetailWire, completionBlock:routeResultCallback)
        }

    }
    
    func run(completionBlock:WireOpenCompletionBlock) {

        presenter?.doPresent()

        completionBlock(wire:self)
    }
    
}
