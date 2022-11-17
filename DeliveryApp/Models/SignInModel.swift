//
//  SignInModel.swift
//  DeliveryApp
//
//  Created by Iskhak Zhutanov on 17/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class SignInModel: NSObject {

    var userDataM = PublishSubject<(String, String)>()
    
    var signInStatusM = PublishSubject<Bool>()
    
    let bag = DisposeBag()
    
    override init() {
        super.init()
        
        userDataM.subscribe(onNext: {
            if $0.0 == UserData.shared.userDefaults.string(forKey: "email") && $0.1 == UserData.shared.keychain.get("password") {
                self.signInStatusM.onNext(true)
            } else {
                self.signInStatusM.onNext(false)
            }
        }).disposed(by: bag)
        
    }
}
