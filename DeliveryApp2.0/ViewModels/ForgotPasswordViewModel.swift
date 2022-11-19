//
//  ForgotPasswordViewModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 19/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class ForgotPaswordViewModel: NSObject {
    
    let bag = DisposeBag()
    
    let model = ForgotPasswordModel()
    
    var emailVM = PublishSubject<String>()
    var passwordVM = PublishSubject<String>()
    
    override init() {
        super.init()
        
        model.passwordM.subscribe(onNext: {
            self.passwordVM.onNext($0)
        }).disposed(by: bag)
        
        emailVM.subscribe(onNext: {
            self.model.emailM.onNext($0)
        }).disposed(by: bag)
        
    }
}
