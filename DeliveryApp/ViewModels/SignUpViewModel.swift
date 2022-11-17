//
//  SignUpViewModel.swift
//  DeliveryApp
//
//  Created by Iskhak Zhutanov on 17/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpViewModel: NSObject {
    
    private let model = SignUpModel()
    
    let bag = DisposeBag()
    
    var userDataVM = PublishSubject<(String, String)>()
    
    override init() {
        super.init()
        
        userDataVM.subscribe(onNext: {
            self.model.userDataM.onNext($0)
        }).disposed(by: bag)
        
    }
}
