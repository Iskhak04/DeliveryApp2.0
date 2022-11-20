//
//  HomeViewController.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 20/11/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    let bag = DisposeBag()
    
    private let viewModel = HomeViewModel()
    
    private var ordersV: [Order] = []
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var headerLabel: UILabel = {
        let view = UILabel()
        view.text = "Giving shine to your product!"
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = UIFont(name: "Arial", size: 25)
        view.textColor = .white
        return view
    }()
    
    private lazy var ordersTableView: UITableView = {
        let view = UITableView()
        view.register(OrderCell.self, forCellReuseIdentifier: "OrderCell")
        view.dataSource = self
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.ordersVM.subscribe(onNext: {
            self.ordersV = $0
        }).disposed(by: bag)
        
        viewModel.getOrdersVM.onNext(true)
        
        layout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.getOrdersVM.onNext(true)
        ordersTableView.reloadData()
    }

    private func layout() {
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.left.equalTo(view.snp.left).offset(20)
            make.height.equalTo(80)
            make.width.equalTo(200)
        }
        
        headerView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.left.equalTo(headerView.snp.left).offset(10)
            make.top.equalTo(headerView.snp.top).offset(10)
            make.right.equalTo(headerView.snp.right).offset(-10)
            make.bottom.equalTo(headerView.snp.bottom).offset(-10)
        }
        
        view.addSubview(ordersTableView)
        ordersTableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(40)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersV.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ordersTableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
        cell.orderNameLabel.text = ordersV[indexPath.row].name
        cell.destinationLabel.text = "\(String(describing: ordersV[indexPath.row].from)) <-> \(String(describing: ordersV[indexPath.row].toWhere))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
