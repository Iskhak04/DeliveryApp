//
//  ForgotPasswordModel.swift
//  DeliveryApp
//
//  Created by Iskhak Zhutanov on 17/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class ForgotPasswordModel: NSObject {

    var userDataM = PublishSubject<String>()
    
    var passwordM = PublishSubject<String>()
    
    let bag = DisposeBag()
    
    override init() {
        super.init()
        
        userDataM.subscribe(onNext: {
            if UserData.shared.userDefaults.string(forKey: "email") == $0 {
                self.passwordM.onNext(UserData.shared.keychain.get("password")!)
            }
        }).disposed(by: bag)
        
    }
}
