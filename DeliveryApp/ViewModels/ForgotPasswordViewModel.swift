//
//  ForgotPasswordViewModel.swift
//  DeliveryApp
//
//  Created by Iskhak Zhutanov on 17/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class ForgotPasswordViewModel: NSObject {
    
    private let model = ForgotPasswordModel()
    
    let bag = DisposeBag()
    
    var userDataVM = PublishSubject<String>()
    
    var passwordVM = PublishSubject<String>()
    
    override init() {
        super.init()
        
        model.passwordM.subscribe(onNext: {
            self.passwordVM.onNext($0)
        }).disposed(by: bag)
        
        userDataVM.subscribe(onNext: {
            self.model.userDataM.onNext($0)
        }).disposed(by: bag)
        
    }
}
