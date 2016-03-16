//
//  ListIteractor.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

class ListInteractor: ListInteractorProtocol, ListDatasourceListenerProtocol {

    var presenter:ListPresenterProtocol?
    var dataSource:ListDatasource
    
    deinit {
    
        self.dataSource.listener = nil
    }
    
    init(){
        
        self.dataSource = ListDatasource()
        
        self.dataSource.listener = self
    }
    
    func numberOfEntities() -> Int {
        
        return self.dataSource.numberOfItems()
    }
    
    func entityAtIndex(index:Int) throws -> ListEntity {
        
        let obj = try self.dataSource.itemAtIndex(index)
        let mapped = ListMapping.listEntityFromDetailEntity(obj)
        return mapped
    }
    
    func needNewData() {
        
        self.dataSource.reload()
    }
    
    //MARK: - ListDatasourceListenerProtocol
    func hasUpdatedData() {
        
        self.presenter?.refresh()
        
    }
    
    func hasCreatedData() {
        
    }
}
