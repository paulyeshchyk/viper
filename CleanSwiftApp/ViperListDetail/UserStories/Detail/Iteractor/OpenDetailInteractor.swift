//
//  DetailIteractor.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/15/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class OpenDetailIteractor: NSObject, DetailInteractorProtocol, ListDatasourceListenerProtocol {

    var presenter:DetailPresenterProtocol?
    var listEntity:ListEntity
    var listDatasource:ListDatasource

    deinit {
        
        self.listDatasource.listener = nil
    }
    
    override init() {
        
        listEntity = ListEntity(id: NSNull(), name: "")
        listDatasource = ListDatasource()
        
        super.init()
        listDatasource.listener = self
    }
    
    
    func setIdent(ident: AnyObject) {
        
        self.listEntity.id = ident
    }
    
    func setName(name: String) {
        
        self.listEntity.name = name
    }
    
    func loadDetail(detailId:AnyObject) {
        
        
        self.listDatasource.findObjectByDetailId(detailId) { (obj) -> () in
        
            guard let object = obj  else {
                
                return
            }
            self.listEntity = object
            self.presenter?.refresh()
        }
        
    }
    
    func save() {

        listDatasource.saveObjectByDetailId(self.listEntity.id) { (obj:DetailEntity) -> () in
         
            obj.name = self.listEntity.name
        }
        
    }
    
    func createNewObject() {

        listDatasource.createNewObject { (obj:DetailEntity) -> () in

            obj.name = self.listEntity.name
            obj.ident = String(format: "%f", arguments: [NSDate.timeIntervalSinceReferenceDate()])
        }
    }
    
    func hasUpdatedData() {
    
        self.presenter?.dataHasBeenUpdated()
    }
    
    func hasCreatedData() {
        
        self.presenter?.dataHasBeenCreated()
    }

}
