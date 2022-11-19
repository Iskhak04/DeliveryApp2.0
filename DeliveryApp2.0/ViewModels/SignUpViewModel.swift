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
    
    override init() {
        super.init()
        
        
    }
}
