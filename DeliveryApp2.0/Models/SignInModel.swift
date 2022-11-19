//
//  SignInModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 19/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class SignInModel: NSObject {
    
    let bag = DisposeBag()
    
    var userDataM = PublishSubject<(String, String)>()
    var statusM = PublishSubject<Bool>()
    
    override init() {
        super.init()
        
        userDataM.subscribe(onNext: {
            if UserData.shared.email.string(forKey: "email") == $0.0 && UserData.shared.password.get("password") == $0.1 {
                self.statusM.onNext(true)
            } else {
                self.statusM.onNext(false)
            }
        }).disposed(by: bag)
        
    }
}
