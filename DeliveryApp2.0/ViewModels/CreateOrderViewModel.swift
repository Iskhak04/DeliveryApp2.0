//
//  CreateOrderViewModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 20/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class CreateOrderViewModel: NSObject {
    
    let bag = DisposeBag()
    
    let model = CreateOrderModel()
    
    var orderToAddVM = PublishSubject<OrderModel>()
    
    override init() {
        super.init()
        
        orderToAddVM.subscribe(onNext: {
            self.model.orderToAddM.onNext($0)
        }).disposed(by: bag)
        
    }
}
