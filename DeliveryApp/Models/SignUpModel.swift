//
//  SignUpModel.swift
//  DeliveryApp
//
//  Created by Iskhak Zhutanov on 17/11/22.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpModel: NSObject {

    var userDataM = PublishSubject<(String, String)>()
    
    let bag = DisposeBag()
    
    override init() {
        super.init()
        
        userDataM.subscribe(onNext: {
            UserData.shared.userDefaults.set($0.0, forKey: "email")
            UserData.shared.keychain.set($0.1, forKey: "password")
        }).disposed(by: bag)
        print("hello world")
    }
}
