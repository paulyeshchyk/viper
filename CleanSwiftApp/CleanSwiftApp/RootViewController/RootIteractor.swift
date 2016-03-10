//
//  RootIteractor.swift
//  CleanSwiftApp
//
//  Created by Pavel Yeshchyk on 3/10/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import Foundation

class RootIteractor: NSObject, RootIteractorProtocol {

    var output:RootPresenterProtocol?
 
    
    func fetchData() {

        //do network call
        self.output?.parseResponse()
    }
}
