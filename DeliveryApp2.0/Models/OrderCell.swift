//
//  OrderCell.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 20/11/22.
//

import UIKit

class OrderCell: UITableViewCell {
    
    var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 20
        return view
    }()
    
    var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 18
        return view
    }()
    
    var orderNameLabel: UILabel = {
        let view = UILabel()
        
        return view
    }()
    
    var destinationLabel: UILabel = {
        let view = UILabel()
        
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(0)
            make.left.equalTo(snp.left).offset(0)
            make.right.equalTo(snp.right).offset(0)
            make.bottom.equalTo(snp.bottom).offset(0)
        }
        
        bgView.addSubview(whiteView)
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(2)
            make.left.equalTo(snp.left).offset(2)
            make.right.equalTo(snp.right).offset(-2)
            make.bottom.equalTo(snp.bottom).offset(-2)
        }
        
        whiteView.addSubview(orderNameLabel)
        orderNameLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(10)
            make.left.equalTo(snp.left).offset(15)
        }
        
        whiteView.addSubview(destinationLabel)
        destinationLabel.snp.makeConstraints { make in
            make.top.equalTo(orderNameLabel.snp.bottom).offset(10)
            make.left.equalTo(snp.left).offset(20)
        }
    }
}
