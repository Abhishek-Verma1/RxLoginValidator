//
//  ViewController.swift
//  RxLoginValidator
//
//  Created by Abhishek Verma on 6/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var loginViewmodel = LoginViewModel()
    let disboseBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _ =  userNameTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewmodel.userNameText)
        _ =  passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewmodel.passwordText)
        
        _ = loginViewmodel.isValid.bind(to: loginButton.rx.isEnabled)
        
        loginViewmodel.isValid.subscribe(onNext: { [unowned self] isvalid in
            self.loginButton.backgroundColor = isvalid ? .red : .gray
            
        }).disposed(by: disboseBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

