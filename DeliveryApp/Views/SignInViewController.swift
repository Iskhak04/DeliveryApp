//
//  SignInView.swift
//  DeliveryApp
//
//  Created by Iskhak Zhutanov on 15/11/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SignInViewController: UIViewController {
    
    let bag = DisposeBag()
    
    private let viewModel = SignInViewModel()
    
    private lazy var mainImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "main")
        return view
    }()
    
    private lazy var signInLabel: UILabel = {
        let view = UILabel()
        view.text = "Sign In"
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @objc func forgotPasswordButtonClicked() {
        
    }
    
    @objc func signInButtonClicked() {
        guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else { return }
        
        viewModel.signInStatusVM.subscribe(onNext: {
            if $0 == true {
                let alert = UIAlertController(title: "Success", message: "You've successfully signed in", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: "Error", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }).disposed(by: bag)
        
        viewModel.userDataVM.onNext((email, password))
    }
    
    @objc func signUpButtonClicked() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    private func layout() {
        view.addSubview(mainImageView)
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(120)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(120)
            make.width.equalTo(120)
        }
        
        view.addSubview(signInLabel)
        signInLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(40)
            make.centerX.equalTo(view.snp.centerX).offset(0)
        }
        
        view.addSubview(emailBorderView)
        emailBorderView.snp.makeConstraints { make in
            make.top.equalTo(signInLabel.snp.bottom).offset(30)
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
        
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordBorderView.snp.bottom).offset(20)
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
            make.top.equalTo(signInButton.snp.bottom).offset(15)
            make.centerX.equalTo(view.snp.centerX).offset(0)
        }
    }
}
