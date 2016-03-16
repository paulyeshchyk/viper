//
//  DetailViewController.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/15/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailViewProtocol, UITextFieldDelegate {

    var presenter:DetailPresenterProtocol?

    var nameValue:String? {
        
        didSet {
            
            if self.isViewLoaded() {
                
                self.nameTextField?.text = self.nameValue
            }
        }
    }
    
    @IBOutlet var nameTextField:UITextField?
    @IBOutlet var idTextField:UITextField?

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        self.nameTextField?.text = self.nameValue
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {

        if textField == self.nameTextField {
            
            self.presenter?.hasChangedNameValue(textField.text!)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        
        return true
    }
}
