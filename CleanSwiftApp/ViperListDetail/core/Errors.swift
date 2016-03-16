//
//  Errors.swift
//  ViperListDetail
//
//  Created by Pavel Yeshchyk on 3/14/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import Foundation

enum LoginError: ErrorType {
    case EmptyName
    case EmptyPassword
    case NoIteractor
}

enum FetchError:ErrorType {
    
    case FetchedObjectNotFound
    case FetchedObjectHasWrongType
}

enum PresenterError:ErrorType {
    
    case DetailNotFound
}