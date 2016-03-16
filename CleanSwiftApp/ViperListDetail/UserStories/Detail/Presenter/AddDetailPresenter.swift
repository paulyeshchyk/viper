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
    var wireFrame:WireFrameProtocol
    
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
    
    required init(wireFrame:WireFrameProtocol) {
        
        self.wireFrame = wireFrame
        super.init()
    }
    
    func doPresent() {
        
        self.wireFrame.appDelegate.findOrCreateNavigationControllerAndPushPresenter(self)
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

        self.wireFrame.appDelegate.findNavigationControllerPopPresented()
    }
    
    //MARK: - DetailWireInputProtocol
    func setDetailID(detailID: AnyObject) {
        
        
    }

}
