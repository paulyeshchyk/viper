//
//  ListEntity.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/15/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListEntity: NSObject {

    var name:String
    var id:AnyObject
    
    required init(id:AnyObject, name:String) {
        
        self.name = name
        self.id = id
    }
}
