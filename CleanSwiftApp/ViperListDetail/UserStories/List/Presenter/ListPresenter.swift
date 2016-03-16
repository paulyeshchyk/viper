//
//  ListPresenter.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit
class ListPresenter:NSObject, ListPresenterProtocol, WireInputProtocol {

    var theApp:TheAppProtocol
    var view:ListViewProtocol?
    var output:ListIteractorProtocol?
    var wire:WireProtocol?
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

    required init(theApp: TheAppProtocol) {
        
        self.theApp = theApp
        super.init()
    }
    
    func doPresent() {
        
        theApp.setRootPresenter(self)
        self.output?.needNewData()
    }
    
    func addItem(item:UIBarButtonItem) {
        
        self.wire?.wireFrame.run(.AddDetailWire, completionBlock: { (wire) -> () in
            
        })
    }
    
    func numberOfDetails() -> Int {

        guard let output = self.output else {
            
            return 0
        }
        
        return output.numberOfEntities()
    }
    
    func detailAtIndex(index: Int) throws -> ListEntity? {
        
        guard let output = self.output else {
            
            throw PresenterError.DetailNotFound
        }
        
        return try output.entityAtIndex(index)
        
    }
    
    func openDetailAtIndex(index: Int) {
        
        self.wire?.wireFrame.run(.OpenDetailWire, completionBlock: {(wire:WireProtocol) in
            
            guard let output = self.output else {
                
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
            
        })
    }
    
    //MARK: ListPresenterProtocol
    func refresh() {
        
        self.view?.reloadTableView()
    }
}
