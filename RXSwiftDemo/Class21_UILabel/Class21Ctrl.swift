//
//  Class21Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Class21Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class21Ctrl
    }
    lazy var lb:UILabel = {
        let lable = UILabel.init(frame: CGRect.init(x: 20, y: 150, width: 100, height: 44))
        lable.backgroundColor = UIColor.yellow
        self.view.addSubview(lable)
        return lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Observable<Int>.interval(1, scheduler: MainScheduler.init())
            .map{"Index:\($0)"}
            .bind(to: lb.rx.text)
            .disposed(by: disposeBag)
        
    }
}
