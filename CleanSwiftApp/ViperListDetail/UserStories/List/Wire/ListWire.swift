//
//  ListWire.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListWire: NSObject, WireProtocol {

    
    var wireFrame:WireFrameProtocol
    var wireType:WireType
    var presenter:PresenterProtocol
    var input:WireInputProtocol
    
    required init(type:WireType, wireFrame:WireFrameProtocol) {

        let iteractor = ListIteractor()
        
        let presenter = ListPresenter(theApp:wireFrame.appDelegate)
        
        let vc = ListViewController(nibName:"ListViewController", bundle: NSBundle.mainBundle())
        vc.presenter = presenter
        presenter.view = vc
        presenter.output = iteractor
        
        iteractor.presenter = presenter
        
        self.wireType = type
        self.wireFrame = wireFrame
        self.presenter = presenter
        self.input = presenter
        
        super.init()
        self.presenter.wire = self
    }
    
    func run(completionBlock:WireOpenCompletionBlock) {

        presenter.doPresent()

        completionBlock(wire:self)
    }
    
    func done() {
        
    }
    
}
