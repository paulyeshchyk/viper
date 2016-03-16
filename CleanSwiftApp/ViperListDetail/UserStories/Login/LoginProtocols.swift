//
//  LoginProtocols.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import Foundation

typealias LoginCompletion = (valid:Bool) -> Void

protocol LoginPresenterProtocol:PresenterProtocol {
    
    var view:LoginViewProtocol? {get set}
    var interactor:LoginInteractorProtocol? {get set}

    func cancelLogin()
    func performLogin() throws
}

protocol LoginViewProtocol:ViewProtocol {
    
    var presenter:LoginPresenterProtocol? {get set}
    
    var userName:String? {get set}
    var password:String? {get set}
}

protocol LoginInteractorProtocol:InteractorProtocol {
    
    var input:LoginPresenterProtocol? {get set}
    
    func authenticate(username:String, password:String,completion:LoginCompletion)
    
}
