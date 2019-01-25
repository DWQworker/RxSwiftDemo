//
//  Class6Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/19.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Class6Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class6Ctrl
    }
    lazy var lable :UILabel = {
        let lb =  UILabel.init(frame: CGRect.init(x: 40, y: 80, width: 200, height: 200))
        lb.backgroundColor = UIColor.purple
        self.view.addSubview(lb)
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let observable = Observable<Int>.timer(1, period: 0.5, scheduler: MainScheduler.instance)
        lable.text = "dsj"
        lable.font = UIFont.systemFont(ofSize: 0)
        observable
        .map{CGFloat($0)}
        .bind(to: lable.rx.dsjFontSize)
        .disposed(by: disposeBag)
            
        
    }
    
    
}

extension Reactive where Base: UILabel
{
    public var dsjFontSize:Binder<CGFloat>
    {
        return Binder(self.base){(lb ,value) in
           lb.font = UIFont.systemFont(ofSize: value)
       }
    }
}

extension UILabel
{
    public var fontSize:Binder<CGFloat>{
        
        return Binder(self){(lb ,value) in
            lb.font = UIFont.systemFont(ofSize: value)
            
        }
    }
}
