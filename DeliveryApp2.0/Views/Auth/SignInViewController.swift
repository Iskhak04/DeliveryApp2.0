//
//  SignInViewController.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 19/11/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SignInViewController: UIViewController {
    
    private let viewModel = SignInViewModel()
    
    private lazy var mainImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "main")
        return view
    }()
    
    private lazy var signInLabel: UILabel = {
        let view = UILabel()
        view.text = "Sign In"
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
    
    //MARK: Password
    private lazy var passwordBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 27
        return view
    }()
    
    private lazy var passwordWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var passwordImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "lock", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .large))
        view.tintColor = .lightGray
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Password"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.isSecureTextEntry = true
        return view
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let view = UIButton()
        view.setTitle("Forgot Password?", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.addTarget(self, action: #selector(forgotPasswordButtonClicked), for: .touchUpInside)
        return view
    }()
    
    private lazy var signInButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sign In", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 30
        view.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
        return view
    }()
    
    private lazy var signUpButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sign Up", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        layout()
        
    }
    
    @objc func forgotPasswordButtonClicked() {
        let forgotPasswordVC = ForgotPasswordViewController()
        navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
    @objc func signInButtonClicked() {
        
    }
    
    @objc func signUpButtonClicked() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }

    private func layout() {
        let BGViewWidth = view.frame.width - 40
        let BGViewHeight = 55
        
        view.addSubview(mainImageView)
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(120)
            make.centerX.equalTo(view.snp.centerX).offset(0)
        }
        
        view.addSubview(signInLabel)
        signInLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX).offset(0)
        }
        
        //Email
        view.addSubview(emailBackgroundView)
        emailBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(signInLabel.snp.bottom).offset(20)
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
        
        //Password
        view.addSubview(passwordBackgroundView)
        passwordBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(emailBackgroundView.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(BGViewHeight)
            make.width.equalTo(BGViewWidth)
        }
        
        passwordBackgroundView.addSubview(passwordWhiteView)
        passwordWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(BGViewWidth - 4)
            make.height.equalTo(BGViewHeight - 4)
        }
        
        passwordWhiteView.addSubview(passwordImageView)
        passwordImageView.snp.makeConstraints { make in
            make.centerY.equalTo(passwordWhiteView.snp.centerY).offset(0)
            make.left.equalTo(passwordWhiteView.snp.left).offset(20)
        }
        
        passwordWhiteView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerY.equalTo(passwordWhiteView.snp.centerY).offset(0)
            make.left.equalTo(passwordImageView.snp.right).offset(15)
            make.right.equalTo(passwordWhiteView.snp.right).offset(-20)
        }
        
        //Buttons
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordBackgroundView.snp.bottom).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
        }
        
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(40)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
        
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX).offset(0)
        }
    }
}
