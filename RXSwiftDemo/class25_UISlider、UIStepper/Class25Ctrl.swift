//
//  Class25Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class25Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class25Ctrl
    }
    lazy var slider:UISlider = {
        let s = UISlider.init(frame: CGRect.init(x: 20, y: 100, width: 200, height: 20))
        s.maximumValue = 100
        
        self.view.addSubview(s)
        return s
    }()
    
    lazy var step :UIStepper = {
        let st = UIStepper.init(frame: CGRect.init(x: 20, y: 200, width: 200, height: 44))
        
        self.view.addSubview(st)
        return st
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.rx.value.asObservable()
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        step.rx.value.asObservable()
            .subscribe({
                debugPrint($0)
            }).disposed(by: disposeBag)
        //FIXME:
//        slider.rx.value
//            .map{ Double($0) }  //由于slider值为Float类型，而stepper的stepValue为Double类型，因此需要转换
//            .bind(to: step.rx.stepValue)
//            .disposed(by: disposeBag)
    }
}
