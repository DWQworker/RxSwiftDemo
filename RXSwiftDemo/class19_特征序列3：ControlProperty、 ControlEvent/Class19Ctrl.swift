//
//  Class19Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxCocoa

class Class19Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class19Ctrl
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
    
    lazy var bt :UIButton = {
       let btn = UIButton.init(frame: CGRect.init(x: 20, y: 200, width: 60, height: 44))
        btn.backgroundColor = UIColor.green
        self.view.addSubview(btn)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     tf.rx.text
            .bind(to: lb.rx.text)
            .disposed(by: disposeBag)
        
        bt.rx.tap
        .subscribe{
                debugPrint($0)
        }
        .disposed(by:disposeBag)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.rx.viewDidLoad
        .subscribe({
            debugPrint("dddddd")
            debugPrint($0)
        })
        .disposed(by: disposeBag)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.rx.viewDidLoad
            .subscribe({
                debugPrint("ssss")
                debugPrint($0)
            })
            .disposed(by: disposeBag)
    }
    
}
