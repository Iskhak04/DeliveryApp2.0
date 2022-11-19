//
//  SignInViewModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 19/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class SignInViewModel: NSObject {
    
    let bag = DisposeBag()
    
    let model = SignInModel()
    
    var userDataVM = PublishSubject<(String, String)>()
    var statusVM = PublishSubject<Bool>()
    
    override init() {
        super.init()
        
        model.statusM.subscribe(onNext: {
            self.statusVM.onNext($0)
        }).disposed(by: bag)
        
        userDataVM.subscribe(onNext: {
            self.model.userDataM.onNext($0)
        }).disposed(by: bag)
        
    }
}
