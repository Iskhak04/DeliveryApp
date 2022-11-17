//
//  ForgotPasswordViewController.swift
//  DeliveryApp
//
//  Created by Iskhak Zhutanov on 17/11/22.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class ForgotPasswordViewController: UIViewController {
    
    let bag = DisposeBag()
    
    private let viewModel = ForgotPasswordViewModel()
    
    private lazy var signInLabel: UILabel = {
        let view = UILabel()
        view.text = "Forgot Password"
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
    
    private lazy var confirmButton: UIButton = {
        let view = UIButton()
        view.setTitle("Confirm", for: .normal)
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
            let alert = UIAlertController(title: "Success", message: "Your password is: \($0)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }).disposed(by: bag)
        
        viewModel.userDataVM.onNext(email)
    }

    private func layout() {
        view.addSubview(signInLabel)
        signInLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(140)
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
        
        view.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(emailBorderView.snp.bottom).offset(40)
            make.centerX.equalTo(view.snp.centerX).offset(0)
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
    }
}
