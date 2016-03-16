//
//  ListProtocols.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

protocol ListDatasourceListenerProtocol {
    
    func hasUpdatedData()
    func hasCreatedData()
}

typealias ListDataSourceFindObjectCallback = (obj:ListEntity?) ->()
typealias ListDatasourceCreateNewObjectCallback = (obj:DetailEntity)->()
typealias ListDatasourceSaveObjectCallback = (obj:DetailEntity)->()

protocol ListDatasourceProtocol {
    
    var listener:ListDatasourceListenerProtocol? {get set}

    func numberOfItems() -> Int
    func itemAtIndex(index:Int) throws -> DetailEntity
    func reload()
    func createNewObject(callback:ListDatasourceCreateNewObjectCallback)
    func findObjectByDetailId(detailId:AnyObject, callback:ListDataSourceFindObjectCallback)
    func saveObjectByDetailId(detailId:AnyObject, callback:ListDatasourceSaveObjectCallback)
}

protocol ListPresenterProtocol:PresenterProtocol {
    
    var view:ListViewProtocol? {get set}
    var interactor:ListInteractorProtocol? {get set}
    
    func refresh()
    func numberOfDetails() -> Int
    func detailAtIndex(index:Int) throws -> ListEntity?
    func openDetailAtIndex(index:Int)
    
}

protocol ListViewProtocol:ViewProtocol {
    
    var presenter:ListPresenterProtocol? {get set}
    func reloadTableView()
    
}

protocol ListInteractorProtocol:InteractorProtocol {
    
    var presenter:ListPresenterProtocol? {get set}

    func needNewData()
    
    func numberOfEntities()->Int
    func entityAtIndex(index:Int) throws -> ListEntity
    
}
