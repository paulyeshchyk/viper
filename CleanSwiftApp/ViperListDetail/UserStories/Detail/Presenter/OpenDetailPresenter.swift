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
    var wire:WireProtocol?
    var theApp:TheAppProtocol
    var theDetailID:AnyObject?
    
    
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
    
    func saveItem(item:UIBarButtonItem) {

        self.interactor?.save()
    }

    func hasChangedNameValue(value: String) {
        
        self.interactor?.setName(value)
    }
    
    func hasChangedIdentValue(value: AnyObject) {
        
    }
    
    required init(theApp: TheAppProtocol) {
        
        self.theApp = theApp
        super.init()
    }
    
    func doPresent() {
        
        theApp.findOrCreateNavigationControllerAndPushPresenter(self)
    }
    
    func refresh() {
        
        self.view?.nameValue = self.interactor?.listEntity.name
        
    }
    
    func dataHasBeenSaved() {
        
        theApp.findNavigationControllerPopPresented()
    }
    
    //MARK: - DetailWireInputProtocol
    func setDetailID(detailID: AnyObject) {
        
        theDetailID = detailID
        
        self.interactor?.loadDetail(detailID)
    }
    
}
