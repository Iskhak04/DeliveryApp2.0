//
//  SignUpViewModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 19/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpViewModel: NSObject {
    
    let bag = DisposeBag()
    
    let model = SignUpModel()
    
    var userDataVM = PublishSubject<(String, String)>()
    
    override init() {
        super.init()
        
        userDataVM.subscribe(onNext: {
            self.model.userDataM.onNext($0)
        }).disposed(by: bag)
        
    }
}
