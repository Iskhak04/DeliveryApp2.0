//
//  CreateOrderModel.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 20/11/22.
//

import UIKit
import RxSwift
import RxCocoa
import CoreData

class CreateOrderModel: NSObject {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let bag = DisposeBag()
    
    var orderToAddM = PublishSubject<OrderModel>()
    
    override init() {
        super.init()
        
        orderToAddM.subscribe(onNext: {
            let newOrder = Order(context: self.context)
            
            newOrder.name = $0.name
            newOrder.from = $0.from
            newOrder.toWhere = $0.toWhere
            newOrder.width = $0.width
            newOrder.height = $0.height
            newOrder.mass = $0.mass
            newOrder.comment = $0.comment
            
            do {
                try self.context.save()
            } catch let error {
                fatalError("error adding new order \(error.localizedDescription)")
            }
        }).disposed(by: bag)
        
    }
}
