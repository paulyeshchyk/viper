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
    
    var wire:WireProtocol?
    var theApp:TheAppProtocol
    
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

        self.interactor?.createNewObject()
    }
    
    required init(theApp: TheAppProtocol) {
        
        self.theApp = theApp
        super.init()
    }
    
    func doPresent() {
        
        theApp.findOrCreateNavigationControllerAndPushPresenter(self)
    }
    
    
    func hasChangedIdentValue(value: AnyObject) {
    
        self.interactor?.setIdent(value)
    
    }
    
    func hasChangedNameValue(value: String) {
        
        self.interactor?.setName(value)
    }
    
    func refresh() {
        
    }
    
    func dataHasBeenSaved() {

        theApp.findNavigationControllerPopPresented()
    }
    
    //MARK: - DetailWireInputProtocol
    func setDetailID(detailID: AnyObject) {
        
        
    }

}
