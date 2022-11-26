//
//  ContactsModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 26/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class ContactsModel: NSObject {
    
    let bag = DisposeBag()
    
    var getEmailM = PublishSubject<Bool>()
    var userDataM = PublishSubject<(String, String)>()
    
    override init() {
        super.init()
        
        getEmailM.subscribe(onNext: {
            if $0 == true {
                let email = UserData.shared.email.string(forKey: "email")!
                var name = ""
                
                if email.contains("@") {
                    let range = email.range(of: "@")
                    guard let index = range?.lowerBound else { return }
                    
                    name = String(email[..<index])
                } else {
                    name = email
                }
                
                self.userDataM.onNext((email, name))
            }
        }).disposed(by: bag)
        
    }
}
