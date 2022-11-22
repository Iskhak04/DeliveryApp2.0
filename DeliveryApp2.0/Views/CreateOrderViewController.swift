//
//  CreateOrderViewController.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 20/11/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CreateOrderViewController: UIViewController {
    
    let bag = DisposeBag()
    
    private let viewModel = CreateOrderViewModel()
    
    private lazy var mainLabel: UILabel = {
        let view = UILabel()
        view.text = "New Order"
        view.font = UIFont(name: "Arial", size: 25)
        return view
    }()
    
    //MARK: Name
    private lazy var nameBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var nameWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 23
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Name"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
    }()
    
    //MARK: From
    private lazy var fromBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var fromWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 23
        return view
    }()
    
    private lazy var fromTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "From"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
    }()
    
    //MARK: toWhere
    private lazy var toWhereBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var toWhereWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 23
        return view
    }()
    
    private lazy var toWhereTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "To where"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
    }()
    
    //MARK: Width
    private lazy var widthBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var widthWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 23
        return view
    }()
    
    private lazy var widthTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Width"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
    }()
    
    //MARK: Height
    private lazy var heightBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var heightWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 23
        return view
    }()
    
    private lazy var heightTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Height"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
    }()
    
    //MARK: Mass
    private lazy var massBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var massWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 23
        return view
    }()
    
    private lazy var massTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Mass"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
    }()
    
    //MARK: Comment
    private lazy var commentBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var commentWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 23
        return view
    }()
    
    private lazy var commentTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Comment..."
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
    }()
    
    //MARK: Button
    private lazy var createButton: UIButton = {
        let view = UIButton()
        view.setTitle("Create", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 30
        view.addTarget(self, action: #selector(createButtonClicked), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        nameTextField.text = ""
        fromTextField.text = ""
        toWhereTextField.text = ""
        widthTextField.text = ""
        heightTextField.text = ""
        massTextField.text = ""
        commentTextField.text = ""
    }
    
    @objc func createButtonClicked() {
        let name = nameTextField.text
        let from = fromTextField.text
        let toWhere = toWhereTextField.text
        let width = widthTextField.text
        let height = heightTextField.text
        let mass = massTextField.text
        let comment = commentTextField.text
        
        if name!.isEmpty || from!.isEmpty || toWhere!.isEmpty || width!.isEmpty || height!.isEmpty || mass!.isEmpty || comment!.isEmpty {
            showAlert(title: "Error", message: "Please fill out the empty fields!")
        } else if Double(width!) == nil || Double(height!) == nil || Double(mass!) == nil {
            showAlert(title: "Error", message: "Width, height, and mass should only contain numbers!")
        } else {
            viewModel.orderToAddVM.onNext(OrderModel(name: name!, from: from!, toWhere: toWhere!, width: Double(width!)!, height: Double(height!)!, mass: Double(mass!)!, comment: comment!))
            showAlert(title: "Success", message: "The order was created!")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    private func layout() {
        let BGheight = 50
        let BGwidth = view.frame.width - 30
        let spacing = 20
        
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(140)
            make.centerX.equalTo(view.snp.centerX).offset(0)
        }
        
        //Name
        view.addSubview(nameBackgroundView)
        nameBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(BGheight)
            make.width.equalTo(BGwidth)
        }
        
        nameBackgroundView.addSubview(nameWhiteView)
        nameWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(BGheight - 4)
            make.width.equalTo(BGwidth - 4)
        }
        
        nameWhiteView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.left.equalTo(nameWhiteView.snp.left).offset(20)
            make.right.equalTo(nameWhiteView.snp.right).offset(-20)
            make.centerY.equalTo(nameWhiteView.snp.centerY).offset(0)
        }
        
        //From
        view.addSubview(fromBackgroundView)
        fromBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(nameBackgroundView.snp.bottom).offset(spacing)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(BGheight)
            make.width.equalTo(BGwidth)
        }
        
        fromBackgroundView.addSubview(fromWhiteView)
        fromWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(BGheight - 4)
            make.width.equalTo(BGwidth - 4)
        }
        
        fromWhiteView.addSubview(fromTextField)
        fromTextField.snp.makeConstraints { make in
            make.left.equalTo(fromWhiteView.snp.left).offset(20)
            make.right.equalTo(fromWhiteView.snp.right).offset(-20)
            make.centerY.equalTo(fromWhiteView.snp.centerY).offset(0)
        }
        
        //To where
        view.addSubview(toWhereBackgroundView)
        toWhereBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(fromBackgroundView.snp.bottom).offset(spacing)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(BGheight)
            make.width.equalTo(BGwidth)
        }
        
        toWhereBackgroundView.addSubview(toWhereWhiteView)
        toWhereWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(BGheight - 4)
            make.width.equalTo(BGwidth - 4)
        }
        
        toWhereWhiteView.addSubview(toWhereTextField)
        toWhereTextField.snp.makeConstraints { make in
            make.left.equalTo(toWhereWhiteView.snp.left).offset(20)
            make.right.equalTo(toWhereWhiteView.snp.right).offset(-20)
            make.centerY.equalTo(toWhereWhiteView.snp.centerY).offset(0)
        }
        
        //Width
        view.addSubview(widthBackgroundView)
        widthBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(toWhereBackgroundView.snp.bottom).offset(spacing)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(BGheight)
            make.width.equalTo(BGwidth)
        }
        
        widthBackgroundView.addSubview(widthWhiteView)
        widthWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(BGheight - 4)
            make.width.equalTo(BGwidth - 4)
        }
        
        widthWhiteView.addSubview(widthTextField)
        widthTextField.snp.makeConstraints { make in
            make.left.equalTo(widthWhiteView.snp.left).offset(20)
            make.right.equalTo(widthWhiteView.snp.right).offset(-20)
            make.centerY.equalTo(widthWhiteView.snp.centerY).offset(0)
        }
        
        //Height
        view.addSubview(heightBackgroundView)
        heightBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(widthBackgroundView.snp.bottom).offset(spacing)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(BGheight)
            make.width.equalTo(BGwidth)
        }
        
        heightBackgroundView.addSubview(heightWhiteView)
        heightWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(BGheight - 4)
            make.width.equalTo(BGwidth - 4)
        }
        
        heightWhiteView.addSubview(heightTextField)
        heightTextField.snp.makeConstraints { make in
            make.left.equalTo(heightWhiteView.snp.left).offset(20)
            make.right.equalTo(heightWhiteView.snp.right).offset(-20)
            make.centerY.equalTo(heightWhiteView.snp.centerY).offset(0)
        }
        
        //Mass
        view.addSubview(massBackgroundView)
        massBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(heightBackgroundView.snp.bottom).offset(spacing)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(BGheight)
            make.width.equalTo(BGwidth)
        }
        
        massBackgroundView.addSubview(massWhiteView)
        massWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(BGheight - 4)
            make.width.equalTo(BGwidth - 4)
        }
        
        massWhiteView.addSubview(massTextField)
        massTextField.snp.makeConstraints { make in
            make.left.equalTo(massWhiteView.snp.left).offset(20)
            make.right.equalTo(massWhiteView.snp.right).offset(-20)
            make.centerY.equalTo(massWhiteView.snp.centerY).offset(0)
        }
        
        //Comment
        view.addSubview(commentBackgroundView)
        commentBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(massBackgroundView.snp.bottom).offset(spacing)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(BGheight)
            make.width.equalTo(BGwidth)
        }
        
        commentBackgroundView.addSubview(commentWhiteView)
        commentWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(BGheight - 4)
            make.width.equalTo(BGwidth - 4)
        }
        
        commentWhiteView.addSubview(commentTextField)
        commentTextField.snp.makeConstraints { make in
            make.left.equalTo(commentWhiteView.snp.left).offset(20)
            make.right.equalTo(commentWhiteView.snp.right).offset(-20)
            make.centerY.equalTo(commentWhiteView.snp.centerY).offset(0)
        }
        
        //Button
        view.addSubview(createButton)
        createButton.snp.makeConstraints { make in
            make.top.equalTo(commentBackgroundView.snp.bottom).offset(40)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
    }
}
