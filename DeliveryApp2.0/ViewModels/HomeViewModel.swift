//
//  HomeViewModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 20/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewModel: NSObject {
    
    let bag = DisposeBag()
    
    let model = HomeModel()
    
    var getOrdersVM = PublishSubject<Bool>()
    var ordersVM = PublishSubject<[Order]>()
    
    override init() {
        super.init()
        
        model.ordersM.subscribe(onNext: {
            self.ordersVM.onNext($0)
        }).disposed(by: bag)

        getOrdersVM.subscribe(onNext: {
            self.model.getOrdersM.onNext($0)
        }).disposed(by: bag)
        
    }
}
