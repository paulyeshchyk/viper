//
//  ListPresenter.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListPresenter:NSObject, ListPresenterProtocol, WireInputProtocol {

    var openListRoute:RouteCallback?
    var openDetailRoute:RouteCallback?
    var addItemRoute:RouteCallback?
    var wire:WireProtocol
    var view:ListViewProtocol?
    var interactor:ListInteractorProtocol?
    var vc:UIViewController? {
        
        get {
            
            guard let view = self.view as? UIViewController else {
                
                print ("view not found")
                return nil
            }
            
            let addButton = UIBarButtonItem(title: "Add", style: .Plain, target: self, action: "addItem:")
            
            let result = UINavigationController(rootViewController: view)
            view.navigationItem.setRightBarButtonItems([addButton], animated: false)
            
            
            return result
        }
    }

    required init(wire:WireProtocol) {
        
        self.wire = wire
        super.init()
    }
    
    func doPresent() {
        
        guard let openListRoute = self.openListRoute else {
            
            return
        }
        
        openListRoute(presenter: self) { (wire:WireProtocol) -> () in
            
            self.interactor?.needNewData()
        }
        self.interactor?.needNewData()
    }
    
    func addItem(item:UIBarButtonItem) {
        
        guard let addItemRoute = self.addItemRoute else {
            
            return
        }
        
        addItemRoute(presenter: self){ (wire:WireProtocol) -> () in
        }
    }
    
    func numberOfDetails() -> Int {

        guard let output = self.interactor else {
            
            return 0
        }
        
        return output.numberOfEntities()
    }
    
    func detailAtIndex(index: Int) throws -> ListEntity? {
        
        guard let output = self.interactor else {
            
            throw PresenterError.DetailNotFound
        }
        
        return try output.entityAtIndex(index)
        
    }
    
    func openDetailAtIndex(index: Int) {
        
        
        guard let openDetailRoute = self.openDetailRoute else {
            
            return
        }
        
        openDetailRoute(presenter: self) { (wire:WireProtocol) -> () in

            guard let output = self.interactor else {

                return
            }

            guard let input = wire.input as? DetailWireInputProtocol else {

                return
            }

            do {

                let entity = try output.entityAtIndex(index)
                input.setDetailID(entity.id)
                
            } catch {
                
            }
        }
    }
    
    //MARK: ListPresenterProtocol
    func refresh() {
        
        self.view?.reloadTableView()
    }
}
