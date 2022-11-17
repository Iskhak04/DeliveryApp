//
//  SignUpViewController.swift
//  DeliveryApp
//
//  Created by Iskhak Zhutanov on 16/11/22.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    private lazy var signUpLabel: UILabel = {
        let view = UILabel()
        view.text = "Sign Up"
        view.font = UIFont(name: "Arial Bold", size: 25)
        return view
    }()
    
    private lazy var emailBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var emailWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 28
        return view
    }()
    
    private lazy var emailImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "envelope", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .medium))
        view.tintColor = .gray
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Email"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
    }()
    
    private lazy var passwordBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var passwordWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 28
        return view
    }()
    
    private lazy var passwordImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "lock", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .medium))
        view.tintColor = .gray
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
    
    private lazy var password2BorderView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var password2WhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 28
        return view
    }()
    
    private lazy var password2ImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "lock", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .medium))
        view.tintColor = .gray
        return view
    }()
    
    private lazy var password2TextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Password"
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.isSecureTextEntry = true
        return view
    }()

    
    
    private lazy var signUpButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sign Up", for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 30
        view.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        
    }
    
    @objc func signUpButtonClicked() {
        
    }

    private func layout() {
        view.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(140)
            make.centerX.equalTo(view.snp.centerX).offset(0)
        }
        
        view.addSubview(emailBorderView)
        emailBorderView.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.width.equalTo(view.frame.width - 40)
            make.height.equalTo(60)
        }
        
        emailBorderView.addSubview(emailWhiteView)
        emailWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(view.frame.width - 44)
            make.height.equalTo(56)
        }
        
        emailWhiteView.addSubview(emailImageView)
        emailImageView.snp.makeConstraints { make in
            make.left.equalTo(emailWhiteView.snp.left).offset(20)
            make.centerY.equalToSuperview()
        }
        
        emailWhiteView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.left.equalTo(emailImageView.snp.right).offset(15)
            make.centerY.equalToSuperview()
            make.right.equalTo(emailWhiteView.snp.right).offset(-5)
        }
        
        view.addSubview(passwordBorderView)
        passwordBorderView.snp.makeConstraints { make in
            make.top.equalTo(emailBorderView.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.width.equalTo(view.frame.width - 40)
            make.height.equalTo(60)
        }
        
        passwordBorderView.addSubview(passwordWhiteView)
        passwordWhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(view.frame.width - 44)
            make.height.equalTo(56)
        }
        
        passwordWhiteView.addSubview(passwordImageView)
        passwordImageView.snp.makeConstraints { make in
            make.left.equalTo(passwordWhiteView.snp.left).offset(20)
            make.centerY.equalToSuperview()
        }
        
        passwordWhiteView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.left.equalTo(passwordImageView.snp.right).offset(15)
            make.centerY.equalToSuperview()
            make.right.equalTo(passwordWhiteView.snp.right).offset(-5)
        }
        
        view.addSubview(password2BorderView)
        password2BorderView.snp.makeConstraints { make in
            make.top.equalTo(passwordBorderView.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.width.equalTo(view.frame.width - 40)
            make.height.equalTo(60)
        }
        
        password2BorderView.addSubview(password2WhiteView)
        password2WhiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(view.frame.width - 44)
            make.height.equalTo(56)
        }
        
        password2WhiteView.addSubview(password2ImageView)
        password2ImageView.snp.makeConstraints { make in
            make.left.equalTo(password2WhiteView.snp.left).offset(20)
            make.centerY.equalToSuperview()
        }
        
        password2WhiteView.addSubview(password2TextField)
        password2TextField.snp.makeConstraints { make in
            make.left.equalTo(password2ImageView.snp.right).offset(15)
            make.centerY.equalToSuperview()
            make.right.equalTo(password2WhiteView.snp.right).offset(-5)
        }
    }
}
