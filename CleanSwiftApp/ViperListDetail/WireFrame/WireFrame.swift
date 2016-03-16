//
//  WireFrame.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class WireFrame: NSObject, WireFrameProtocol {
    
    var appDelegate:TheAppProtocol
    
    var wires = [WireType: WireProtocol]()
    
    required init(app: TheAppProtocol) {

        appDelegate = app
        
        super.init()
        
        let loginWire = LoginWire(type: .LoginWire, wireFrame: self)
        wires[loginWire.wireType] = loginWire

        let listWire = ListWire(type: .ListWire, wireFrame: self)
        wires[listWire.wireType] = listWire

        let openDetailWire = OpenDetailWire(type: .OpenDetailWire, wireFrame: self)
        wires[openDetailWire.wireType] = openDetailWire
    
        let addDetailWire = AddDetailWire(type: .AddDetailWire, wireFrame: self)
        wires[addDetailWire.wireType] = addDetailWire
    }

    func run(type:WireType, completionBlock:WireOpenCompletionBlock){
        
        guard let wire = wires[type] else {
        
            print("unable to run wire .\(type)")
            return
        }
        
        wire.run(completionBlock)
    }
    
    
    
    
    
    
    
    
    
}
