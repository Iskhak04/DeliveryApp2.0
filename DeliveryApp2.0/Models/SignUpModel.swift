//
//  SignUpModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 19/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpModel: NSObject {
    
    let bag = DisposeBag()
    
    var userDataM = PublishSubject<(String, String)>()
    
    override init() {
        super.init()
        
        userDataM.subscribe(onNext: {
            UserData.shared.email.set($0.0, forKey: "email")
            UserData.shared.password.set($0.1, forKey: "password")
        }).disposed(by: bag)
        
    }
}
