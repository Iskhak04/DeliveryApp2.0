//
//  SignUpViewController.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 19/11/22.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    private let viewModel = SignUpViewModel()
    
    private lazy var signUpLabel: UILabel = {
        let view = UILabel()
        view.text = "Sign Up"
        view.font = UIFont(name: "Arial", size: 25)
        return view
    }()
    
    //MARK: Name
    private lazy var nameBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 27
        return view
    }()
    
    private lazy var nameWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var nameImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .large))
        view.tintColor = .lightGray
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Name"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
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
    
    //MARK: Password2
    private lazy var password2BackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 27
        return view
    }()
    
    private lazy var password2WhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var password2ImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "lock", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .large))
        view.tintColor = .lightGray
        return view
    }()
    
    private lazy var password2TextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Confirm Password"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.isSecureTextEntry = true
        return view
    }()
    
    private lazy var signUpButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sign Up", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 30
        view.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        layout()
        
    }
    
    @objc func signUpButtonClicked() {
        guard let email = emailTextField.text, let password = passwordTextField.text, let password2 = password2TextField.text, !email.isEmpty, !password.isEmpty, password == password2, let name = nameTextField.text, !name.isEmpty else { return }
        
        viewModel.userDataVM.onNext((email, password))
        
        DatabaseManager.shared.userExists(email: email) { exists in
            guard !exists else {
                //user exists
                return
            }
            
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { result, error in
                guard let _ = result, error == nil else { return }
                
                self.showAlert()
            }
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Success", message: "You successfully signed up!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func layout() {
        let BGViewWidth = view.frame.width - 40
        let BGViewHeight = 55
        
        view.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(140)
            make.centerX.equalTo(view.snp.centerX).offset(0)
        }
        
        //Name
        view.addSubview(nameBackgroundView)
        nameBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(BGViewHeight)
            make.width.equalTo(BGViewWidth)
        }
        
        nameBackgroundView.addSubview(nameWhiteView)
        nameWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(BGViewWidth - 4)
            make.height.equalTo(BGViewHeight - 4)
        }
        
        nameWhiteView.addSubview(nameImageView)
        nameImageView.snp.makeConstraints { make in
            make.centerY.equalTo(nameWhiteView.snp.centerY).offset(0)
            make.left.equalTo(nameWhiteView.snp.left).offset(20)
        }
        
        nameWhiteView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.centerY.equalTo(nameWhiteView.snp.centerY).offset(0)
            make.left.equalTo(nameImageView.snp.right).offset(15)
            make.right.equalTo(nameWhiteView.snp.right).offset(-20)
        }
        
        //Email
        view.addSubview(emailBackgroundView)
        emailBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(nameBackgroundView.snp.bottom).offset(30)
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
        
        //Password2
        view.addSubview(password2BackgroundView)
        password2BackgroundView.snp.makeConstraints { make in
            make.top.equalTo(passwordBackgroundView.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(BGViewHeight)
            make.width.equalTo(BGViewWidth)
        }
        
        password2BackgroundView.addSubview(password2WhiteView)
        password2WhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(BGViewWidth - 4)
            make.height.equalTo(BGViewHeight - 4)
        }
        
        password2WhiteView.addSubview(password2ImageView)
        password2ImageView.snp.makeConstraints { make in
            make.centerY.equalTo(password2WhiteView.snp.centerY).offset(0)
            make.left.equalTo(password2WhiteView.snp.left).offset(20)
        }
        
        password2WhiteView.addSubview(password2TextField)
        password2TextField.snp.makeConstraints { make in
            make.centerY.equalTo(password2WhiteView.snp.centerY).offset(0)
            make.left.equalTo(password2ImageView.snp.right).offset(15)
            make.right.equalTo(password2WhiteView.snp.right).offset(-20)
        }
        
        //Buttons
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(password2BackgroundView.snp.bottom).offset(40)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
    }
}
