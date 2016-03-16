//
//  DetailWire.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/15/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class OpenDetailWire: NSObject, WireProtocol {

    var wireFrame:WireFrameProtocol
    var wireType:WireType
    var presenter:PresenterProtocol
    var input:WireInputProtocol

    
    required init(type:WireType, wireFrame:WireFrameProtocol) {

        let iteractor = OpenDetailIteractor()
        
        let presenter = OpenDetailPresenter(theApp:wireFrame.appDelegate)
        
        let vc = DetailViewController(nibName:"DetailViewController", bundle: NSBundle.mainBundle())
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
