//
//  DetailProtocol.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/15/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import Foundation

protocol DetailPresenterProtocol:PresenterProtocol {
    
    var view:DetailViewProtocol? {get set}
    var output:DetailIteratorProtocol? {get set}
    
    func hasChangedIdentValue(value:AnyObject)
    func hasChangedNameValue(value:String)
    func dataHasBeenSaved()
    func refresh()
}

protocol DetailViewProtocol:ViewProtocol {
 
    var nameValue:String? {get set}
    
}

protocol DetailIteratorProtocol:IteratorProtocol {
 
    var presenter:DetailPresenterProtocol? {get set}

    func loadDetail(detailId:AnyObject)
    
    func setIdent(ident:AnyObject)
    func setName(name:String)

    var listEntity:ListEntity{get set}
    
    func save()
}

protocol DetailWireInputProtocol:WireInputProtocol {
    
    func setDetailID(detailID:AnyObject)
}