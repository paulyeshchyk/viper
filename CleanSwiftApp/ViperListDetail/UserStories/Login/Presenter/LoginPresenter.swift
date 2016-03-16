//
//  LoginPresenter.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class LoginPresenter: NSObject, LoginPresenterProtocol, WireInputProtocol {

    var view:LoginViewProtocol?
    var interactor:LoginInteractorProtocol?
    var wire:WireProtocol
    var openRouteCallback:RouteCallback?
    var authSuccessRouteCallback:RouteCallback?
    var authFailRouteCallback:RouteCallback?
    
    var vc:UIViewController? {
        
        get {
            guard let vc = self.view as? UIViewController else {
                return nil
            }
            return vc
        }
    }
    
    required init(wire:WireProtocol) {
    
        self.wire = wire
        super.init()
    }
    
    func doPresent() {
        
        guard let routeCallback = self.openRouteCallback else {
            
            return
        }
        
        routeCallback(presenter: self) { (wire:WireProtocol) -> () in
            
        }
    }
    
    func cancelLogin() {
        
    }
    
    func performLogin() throws{
     
        guard let name = view?.userName where name.characters.count > 0 else {

            throw LoginError.EmptyName
        }

        guard let pass = view?.password  where pass.characters.count > 0 else {
            
            throw LoginError.EmptyPassword
        }
        
        guard let out = self.interactor else {
            
            throw LoginError.NoIteractor
        }
        
        
        out.authenticate(name, password: pass, completion: {(valid:Bool) in
          
            guard let callback = valid ? self.authSuccessRouteCallback : self.authFailRouteCallback else {
                
                return
            }
            callback(presenter: self, callback: { (wire:WireProtocol) -> () in
                
            })
            
        })
    }
    
}
