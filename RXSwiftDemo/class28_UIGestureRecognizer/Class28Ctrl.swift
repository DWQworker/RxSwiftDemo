//
//  Class28Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class28Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class28Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       let ges = UISwipeGestureRecognizer.init()
          ges.direction = .up
        
        self.view.addGestureRecognizer(ges)
        
        ges.rx.event.subscribe { [weak self]  (sw) in
            debugPrint(sw.element?.location(in: self?.view))
        }
        .disposed(by: disposeBag)
        
        ges.rx.event.bind { (sw) in
            debugPrint("oooo")
        }.disposed(by: disposeBag)
    }

}
