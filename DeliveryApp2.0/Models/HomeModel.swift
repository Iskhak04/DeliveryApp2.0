//
//  HomeModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 20/11/22.
//

import UIKit
import RxSwift
import RxCocoa
import CoreData

class HomeModel: NSObject {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let bag = DisposeBag()
    
    var getOrdersM = PublishSubject<Bool>()
    var ordersM = PublishSubject<[Order]>()
    
    override init() {
        super.init()
        
        getOrdersM.subscribe(onNext: {
            
            if $0 == true {
                do {
                    let orders = try self.context.fetch(Order.fetchRequest())
                    self.ordersM.onNext(orders)
                } catch let error {
                    fatalError("error fetching orders \(error.localizedDescription)")
                }
            }
            
        }).disposed(by: bag)
        
    }
}
