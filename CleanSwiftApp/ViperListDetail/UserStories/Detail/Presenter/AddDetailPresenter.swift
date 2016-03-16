//
//  AddDetailPresenter.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/15/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit


class AddDetailPresenter: NSObject, DetailPresenterProtocol, DetailWireInputProtocol {

    var view:DetailViewProtocol?
    var interactor:DetailInteractorProtocol?
    var wire:WireProtocol
    var openRouteCallback:RouteCallback?
    var saveRouteCallback:RouteCallback?
    
    var vc:UIViewController? {
        
        get {
            
            guard let vc = self.view as? UIViewController else {
                
                print ("view not found")
                return nil
            }
            
            let addButton = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: "saveItem:")
            vc.navigationItem.setRightBarButtonItems([addButton], animated: false)
            return vc
        }
    }
    
    required init(wire:WireProtocol) {
        
        self.wire = wire
        super.init()
    }

    func saveItem(item:UIBarButtonItem) {

        self.interactor?.createNewObject()
    }
    
    func doPresent() {
        
        guard let openRoute = self.openRouteCallback else {
            
            return
        }

        openRoute(presenter: self){ (wire:WireProtocol) -> () in
            
        }
    }
    
    func hasChangedNameValue(value: String) {
        
        self.interactor?.setName(value)
    }
    
    func refresh() {
        
    }

    func dataHasBeenUpdated() {
    
    }
    
    func dataHasBeenCreated() {

        guard let saveRouteCallback = self.saveRouteCallback else {

            return
        }
        
        saveRouteCallback(presenter: self) { (wire:WireProtocol) -> () in
            
        }
    }
    
    //MARK: - DetailWireInputProtocol
    func setDetailID(detailID: AnyObject) {
        
        
    }

}
