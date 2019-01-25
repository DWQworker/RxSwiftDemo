//
//  Class24Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class24Ctrl: ClassBaseCtrl {
    
    override var  webUrl:String?
    {
        return WebUrl.Class24Ctrl
    }
    lazy var sw :UISwitch = {
        let s = UISwitch.init(frame: CGRect.init(x: 20, y: 100, width: 100, height: 100))
        self.view.addSubview(s)
        return s
    }()
    
    lazy var acvtive:UIActivityIndicatorView =
        {
        let a = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
            a.frame = CGRect.init(x: 20, y: 200, width: 100, height: 100)
            
        self.view.addSubview(a)
        return a
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sw.rx.value.bind(to:acvtive.rx.isAnimating)
        .disposed(by: disposeBag)
        
        sw.rx.value
            .bind(to: UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)
    }

}
