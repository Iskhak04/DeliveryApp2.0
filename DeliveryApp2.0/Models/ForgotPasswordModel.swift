//
//  ForgotPasswordModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 19/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class ForgotPasswordModel: NSObject {
    
    let bag = DisposeBag()
    
    var emailM = PublishSubject<String>()
    var passwordM = PublishSubject<String>()
    
    override init() {
        super.init()
        
        emailM.subscribe(onNext: {
            if UserData.shared.email.string(forKey: "email") == $0 {
                self.passwordM.onNext(UserData.shared.password.get("password")!)
            }
        }).disposed(by: bag)
        
    }
}
