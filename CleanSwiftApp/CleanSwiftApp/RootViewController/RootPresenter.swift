//
//  RootPresenter.swift
//  CleanSwiftApp
//
//  Created by Pavel Yeshchyk on 3/10/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import Foundation

class RootPresenter: NSObject, RootPresenterProtocol {

    var output:RootControllerProtocol?
    
    func parseResponse() {
        
        //do parsing
        let data:[String] = ["A","B","C"]
        
        self.output?.displayData(data)
        
    }
}


