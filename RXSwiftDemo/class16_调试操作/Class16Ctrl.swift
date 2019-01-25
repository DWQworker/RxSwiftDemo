//
//  Class16Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class Class16Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class16Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       Observable.of(1,2,3)
        .debug("dsj", trimOutput: true)
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        
    }
}
