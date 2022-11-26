//
//  ContactsViewModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 26/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class ContactsViewModel: NSObject {
    
    let bag = DisposeBag()
    
    let model = ContactsModel()
    
    var getEmailVM = PublishSubject<Bool>()
    var userDataVM = PublishSubject<(String, String)>()
    
    override init() {
        super.init()
        
        model.userDataM.subscribe(onNext: {
            self.userDataVM.onNext($0)
        }).disposed(by: bag)
        
        getEmailVM.subscribe(onNext: {
            self.model.getEmailM.onNext($0)
        }).disposed(by: bag)
        
    }
}
