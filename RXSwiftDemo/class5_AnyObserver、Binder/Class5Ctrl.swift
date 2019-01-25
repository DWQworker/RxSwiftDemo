//
//  Class5Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/19.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class5Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class5Ctrl
    }
    lazy var lable :UILabel = {
        let lb =  UILabel.init(frame: CGRect.init(x: 40, y: 80, width: 200, height: 35))
        lb.backgroundColor = UIColor.purple
        self.view.addSubview(lb)
        return lb
    }()
    
    lazy var lable1 :UILabel = {
        let lb =  UILabel.init(frame: CGRect.init(x: 40, y: 200, width: 200, height: 35))
        lb.backgroundColor = UIColor.cyan
        self.view.addSubview(lb)
        return lb
    }()
    
    lazy var lable2 :UILabel = {
        let lb =  UILabel.init(frame: CGRect.init(x: 40, y: 280, width: 200, height: 35))
        lb.backgroundColor = UIColor.yellow
        self.view.addSubview(lb)
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        
        observable.map{"当前序列:\($0)"}
            .bind{[weak self] (text)  in
                
                self?.lable.text = text
            }
            .disposed(by: disposeBag)
        
        
        let observer :AnyObserver<String> = AnyObserver{[weak self](event) in
            
            switch event
            {
              case .next( let value):
                    self?.lable1.text = value
              default :
                break
            }
            
        }
        
        observable.map{"当前索引数 :\($0)"}
        .bind(to: observer)
        .disposed(by: disposeBag)
        //MARK:Binder
        let binder:Binder<String> = Binder(lable2){(lb , value) in
            lb.text = value
        }
        
        observable.map{"当前索引数 :\($0)"}
            .bind(to: binder)
            .disposed(by: disposeBag)
        
        observable
         .map{ $0 % 2 == 0 }
        .bind(to: lable2.rx.isHidden)
        .disposed(by: disposeBag)
        
    }
    


}

extension Reactive where Base :UIView
{
    public var isHidden:Binder<Bool> {
          return Binder(self.base){(view ,value) in
            view.isHidden = value
        }}
}
