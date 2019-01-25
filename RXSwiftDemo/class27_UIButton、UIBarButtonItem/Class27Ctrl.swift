//
//  Class27Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class27Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class27Ctrl
    }
    
    lazy var bt :UIButton = {
        let btn = UIButton.init(frame: CGRect.init(x: 20, y: 200, width: 60, height: 44))
        btn.backgroundColor = UIColor.green
        self.view.addSubview(btn)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bt.rx.tap
//            .subscribe{ [weak self] in
//                debugPrint($0)
//                self?.showMessage(msg: "按钮被点击")
//            }
//            .disposed(by:disposeBag)
        
       bt.rx.tap
        .bind{ [weak self] in
//            debugPrint("---===")
            self?.showMessage(msg: "按钮被点击")
            
        }
        .disposed(by: disposeBag)
        
        
        
    }
    
    func showMessage(msg:String?)
    {
        let alter = UIAlertController.init(title: "title", message: msg ?? "你好", preferredStyle: .alert)
        let ac =  UIAlertAction.init(title: "确定", style: .default) { (_) in
            
        }
        alter.addAction(ac)
        
        self.present(alter, animated: true) {
            
        }
    }

}
