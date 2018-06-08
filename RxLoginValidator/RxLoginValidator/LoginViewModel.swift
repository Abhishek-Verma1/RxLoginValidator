//
//  LoginViewModel.swift
//  RxLoginValidator
//
//  Created by Abhishek Verma on 6/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    
    var userNameText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(userNameText.asObservable(), passwordText.asObservable()) { userName, password in
            //UserName should be equal and greater than 5, Password should be equal and greater than 6
            userName.characters.count >= 5 && password.characters.count >= 6
        }
    }
}

