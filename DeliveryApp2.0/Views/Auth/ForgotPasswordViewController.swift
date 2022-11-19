//
//  ForgotPasswordViewController.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 19/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class ForgotPasswordViewController: UIViewController {
    
    let bag = DisposeBag()
    
    private let viewModel = ForgotPaswordViewModel()
    
    private lazy var forgotPasswordLabel: UILabel = {
        let view = UILabel()
        view.text = "Forgot Password"
        view.font = UIFont(name: "Arial", size: 25)
        return view
    }()
    
    //MARK: Email
    private lazy var emailBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 27
        return view
    }()
    
    private lazy var emailWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var emailImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "envelope", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .large))
        view.tintColor = .lightGray
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Email"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
    }()
    
    private lazy var confirmButton: UIButton = {
        let view = UIButton()
        view.setTitle("Confirm", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 30
        view.addTarget(self, action: #selector(confirmButtonClicked), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        layout()
        
    }
    
    @objc func confirmButtonClicked() {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        
        viewModel.passwordVM.subscribe(onNext: {
            self.showAlert(password: $0)
        }).disposed(by: bag)
        
        viewModel.emailVM.onNext(email)
    }
    
    private func showAlert(password: String) {
        let alert = UIAlertController(title: "Success", message: "Your password is \(password)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func layout() {
        let BGViewWidth = view.frame.width - 40
        let BGViewHeight = 55
        
        view.addSubview(forgotPasswordLabel)
        forgotPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(240)
            make.centerX.equalTo(view.snp.centerX).offset(0)
        }
        
        //Email
        view.addSubview(emailBackgroundView)
        emailBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(BGViewHeight)
            make.width.equalTo(BGViewWidth)
        }
        
        emailBackgroundView.addSubview(emailWhiteView)
        emailWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(BGViewWidth - 4)
            make.height.equalTo(BGViewHeight - 4)
        }
        
        emailWhiteView.addSubview(emailImageView)
        emailImageView.snp.makeConstraints { make in
            make.centerY.equalTo(emailWhiteView.snp.centerY).offset(0)
            make.left.equalTo(emailWhiteView.snp.left).offset(20)
        }
        
        emailWhiteView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.centerY.equalTo(emailWhiteView.snp.centerY).offset(0)
            make.left.equalTo(emailImageView.snp.right).offset(15)
            make.right.equalTo(emailWhiteView.snp.right).offset(-20)
        }
        
        //Buttons
        view.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(emailBackgroundView.snp.bottom).offset(40)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
    }
}
