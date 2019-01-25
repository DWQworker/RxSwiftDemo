//
//  Class23Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Class23Ctrl: ClassBaseCtrl {
    
    override var  webUrl:String?
    {
        return WebUrl.Class23Ctrl
    }
    lazy var sw :UISwitch = {
       let s = UISwitch.init(frame: CGRect.init(x: 20, y: 100, width: 100, height: 100))
        self.view.addSubview(s)
        return s
    }()
    
    lazy var seg : UISegmentedControl = {
        let se = UISegmentedControl.init(items: ["d","s","j"])
        se.frame = CGRect.init(x: 20, y: 200, width: 200, height: 44)
        self.view.addSubview(se)
        return se
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sw.rx.isOn.asObservable()
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        seg.rx.selectedSegmentIndex.asObservable()
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
    }
}
