//
//  Class26Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Class26Ctrl: ClassBaseCtrl {

    override var  webUrl:String?
    {
        return WebUrl.Class26Ctrl
    }
    lazy var tf :UITextField =
        {
            let textfield = UITextField.init(frame: CGRect.init(x: 20, y: 80, width: 100, height: 44))
            textfield.backgroundColor = UIColor.gray
            textfield.placeholder = "请输入..."
            self.view.addSubview(textfield)
            return textfield
    }()
    
    lazy var lb:UILabel = {
        let lable = UILabel.init(frame: CGRect.init(x: 20, y: 150, width: 100, height: 44))
        self.view.addSubview(lable)
        return lable
    }()
    
    struct UserModel {
        let username = BehaviorRelay.init(value: "guest")
        
        lazy var userInfo = {
            return self.username.asObservable()
                .map{
                    $0 == "dsj" ? "管理员": "访客"
                }
               .share(replay: 1, scope: SubjectLifetimeScope.forever)
            
        }()
    }
    
    var model = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        model.username.asObservable().bind(to: tf.rx.text).disposed(by: disposeBag)
//        tf.rx.text.orEmpty.bind(to: model.username).disposed(by: disposeBag)
         tf.rx.textInput <-> model.username
        model.userInfo.bind(to: lb.rx.text)

    }
}
