//
//  SignInViewModel.swift
//  DeliveryApp
//
//  Created by Iskhak Zhutanov on 17/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class SignInViewModel: NSObject {
    
    private let model = SignInModel()
    
    let bag = DisposeBag()
    
    var userDataVM = PublishSubject<(String, String)>()
    
    var signInStatusVM = PublishSubject<Bool>()
    
    override init() {
        super.init()
        
        model.signInStatusM.subscribe(onNext: {
            self.signInStatusVM.onNext($0)
        }).disposed(by: bag)
        
        userDataVM.subscribe(onNext: {
            self.model.userDataM.onNext($0)
        }).disposed(by: bag)
        
    }
}
