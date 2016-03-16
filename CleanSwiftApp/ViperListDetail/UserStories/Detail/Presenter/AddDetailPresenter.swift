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
    var output:DetailIteratorProtocol?
    var wire:WireProtocol?
    var theApp:TheAppProtocol
    
    var vc:UIViewController? {
        
        get {
            
            guard let vc = self.view as? UIViewController else {
                
                print ("view not found")
                return nil
            }
            let addButton = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: "saveItem:")
            
//            let result = UINavigationController(rootViewController: vc)
            vc.navigationItem.setRightBarButtonItems([addButton], animated: false)
            return vc
        }
    }

    func saveItem(item:UIBarButtonItem) {

        self.output?.save()
    }
    
    required init(theApp: TheAppProtocol) {
        
        self.theApp = theApp
        super.init()
    }
    
    func doPresent() {
        
        theApp.findOrCreateNavigationControllerAndPushPresenter(self)
    }
    
    
    func hasChangedIdentValue(value: AnyObject) {
    
        self.output?.setIdent(value)
    
    }
    
    func hasChangedNameValue(value: String) {
        
        self.output?.setName(value)
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
