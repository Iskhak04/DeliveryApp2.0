//
//  ContactsViewController.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 20/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class ContactsViewController: UIViewController {
    
    let bag = DisposeBag()
    
    private let viewModel = ContactsViewModel()
    
    private var email = ""
    private var name = ""
    
    private lazy var mainLabel: UILabel = {
        let view = UILabel()
        view.text = "Your account"
        view.font = UIFont(name: "Arial", size: 25)
        return view
    }()
    
    private lazy var nameImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .large))
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.text = "Name"
        return view
    }()
    
    private lazy var emailImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "envelope", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .large))
        return view
    }()
    
    private lazy var emailLabel: UILabel = {
        let view = UILabel()
        view.text = "Email"
        return view
    }()
    
    private lazy var helpButton: UIButton = {
        let view = UIButton()
        view.setTitle("Help", for: .normal)
        view.setImage(UIImage(systemName: "questionmark.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .large)), for: .normal)
        view.setTitleColor(.label, for: .normal)
        view.addTarget(self, action: #selector(helpButtonClicked), for: .touchUpInside)
        return view
    }()
    
    private lazy var notificationButton: UIButton = {
        let view = UIButton()
        view.setTitle("Notification", for: .normal)
        view.setImage(UIImage(systemName: "bell", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .large)), for: .normal)
        view.setTitleColor(.label, for: .normal)
        view.addTarget(self, action: #selector(notificationButtonClicked), for: .touchUpInside)
        return view
    }()
    
    private lazy var privacyButton: UIButton = {
        let view = UIButton()
        view.setTitle("Privacy", for: .normal)
        view.setImage(UIImage(systemName: "exclamationmark.shield", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .large)), for: .normal)
        view.setTitleColor(.label, for: .normal)
        view.addTarget(self, action: #selector(privacyButtonClicked), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.userDataVM.subscribe(onNext: {
            self.email = $0.0
            self.name = $0.1
        }).disposed(by: bag)
        
        viewModel.getEmailVM.onNext(true)

        emailLabel.text = email
        nameLabel.text = name
        
        layout()
        
    }
    
    @objc func helpButtonClicked() {
        
    }
    
    @objc func notificationButtonClicked() {
        
    }
    
    @objc func privacyButtonClicked() {
        
    }
    
    private func layout() {
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(120)
            make.centerX.equalTo(view.snp.centerX).offset(0)
        }
        
        view.addSubview(nameImageView)
        nameImageView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(70)
            make.left.equalTo(view.snp.left).offset(40)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(70)
            make.left.equalTo(nameImageView.snp.right).offset(15)
        }
        
        view.addSubview(emailImageView)
        emailImageView.snp.makeConstraints { make in
            make.top.equalTo(nameImageView.snp.bottom).offset(50)
            make.left.equalTo(view.snp.left).offset(40)
        }
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameImageView.snp.bottom).offset(50)
            make.left.equalTo(emailImageView.snp.right).offset(15)
        }
        
        view.addSubview(helpButton)
        helpButton.snp.makeConstraints { make in
            make.top.equalTo(emailImageView.snp.bottom).offset(80)
            make.left.equalTo(view.snp.left).offset(40)
        }
        
        view.addSubview(notificationButton)
        notificationButton.snp.makeConstraints { make in
            make.top.equalTo(helpButton.snp.bottom).offset(30)
            make.left.equalTo(view.snp.left).offset(40)
        }
        
        view.addSubview(privacyButton)
        privacyButton.snp.makeConstraints { make in
            make.top.equalTo(notificationButton.snp.bottom).offset(30)
            make.left.equalTo(view.snp.left).offset(40)
        }
    }
}
