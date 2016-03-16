//
//  DetailPresenter.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/15/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit


class OpenDetailPresenter: NSObject, DetailPresenterProtocol, DetailWireInputProtocol {

    var view:DetailViewProtocol?
    var interactor:DetailInteractorProtocol?
    var wire:WireProtocol
    var theDetailID:AnyObject?
    
    var openRouteCallback:RouteCallback?
    var updateRouteCallback:RouteCallback?
    
    
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

        self.interactor?.save()
    }

    func hasChangedNameValue(value: String) {
        
        self.interactor?.setName(value)
    }
    
    func doPresent() {
        
        guard let openRoute = self.openRouteCallback else {

            return
        }
        
        openRoute(presenter: self) { (wire:WireProtocol) -> () in
            
        }
    }
    
    func refresh() {
        
        self.view?.nameValue = self.interactor?.listEntity.name
        
    }
    
    func dataHasBeenUpdated() {

        guard let updateRouteCallback = self.updateRouteCallback else {
            
            return
        }
        updateRouteCallback(presenter: self){ (wire:WireProtocol) -> () in
            
        }
    }
    
    func dataHasBeenCreated() {
        

    }
    
    //MARK: - DetailWireInputProtocol
    func setDetailID(detailID: AnyObject) {
        
        theDetailID = detailID
        
        self.interactor?.loadDetail(detailID)
    }
    
}
