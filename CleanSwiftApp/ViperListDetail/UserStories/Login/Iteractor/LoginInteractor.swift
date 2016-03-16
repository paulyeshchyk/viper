//
//  LoginIteractor.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class LoginInteractor: LoginInteractorProtocol {

    var input:LoginPresenterProtocol?
    
    func authenticate(username: String, password: String, completion:LoginCompletion) {
        

        completion(valid: (username.compare("Lorem") == .OrderedSame))
    }
}
