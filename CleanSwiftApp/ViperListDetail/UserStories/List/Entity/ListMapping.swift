//
//  ListMapping.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/15/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListMapping: NSObject {

    class func listEntityFromDetailEntity(detailEntity:DetailEntity) -> ListEntity{
        
        let name = detailEntity.name ?? ""
        let ident = detailEntity.ident ?? NSNull()
        
        return ListEntity(id:ident, name:name)
        
    }

    
    
}
