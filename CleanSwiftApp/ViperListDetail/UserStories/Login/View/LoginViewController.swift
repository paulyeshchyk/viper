//
//  LoginViewController.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {

    var presenter:LoginPresenterProtocol?
    var userName:String?
    var password:String?

    @IBOutlet var userNameTextField:UITextField?
    @IBOutlet var passwordTextField:UITextField?
    
    @IBAction func userClickedCancelButton(sender:AnyObject?) {
        
        guard let loginPresenter = self.presenter else {
            
            return
        }
        
        loginPresenter.cancelLogin()
    }
    
    @IBAction func userClickedSigninButton(sender:AnyObject?) {
        
        guard let loginPresenter = self.presenter else {
            
            return
        }
        
        self.userName = self.userNameTextField?.text
        self.password = self.passwordTextField?.text
        
        do {
            
            try loginPresenter.performLogin()
        }  catch {
            print("")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.userNameTextField?.text = self.userName
        self.passwordTextField?.text = self.password
        
    }

    
    
    
}
