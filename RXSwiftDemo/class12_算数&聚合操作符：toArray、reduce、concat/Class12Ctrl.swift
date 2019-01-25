//
//  Class12Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/20.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class12Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class12Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //toArray
        Observable.of(1,2,3)
        .toArray()
            .subscribe({ev in
                debugPrint(ev)
            })
        .disposed(by: disposeBag)
        //reduce
        Observable.of(1,2,3,4,5)
        .reduce(0, accumulator: +)
            .subscribe { (value) in
                debugPrint(value)
        }
        .disposed(by: disposeBag)
        
        let sub1 = BehaviorSubject.init(value: 1)
        let sub2 = BehaviorSubject.init(value: 2)
    
        //concatconcat 会把多个 Observable 序列合并（串联）为一个 Observable 序列。
       // 并且只有当前面一个 Observable 序列发出了 completed 事件，才会开始发送下一个 Observable 序列事件。
      let vari = BehaviorRelay.init(value: sub1)
        vari.concat()
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        sub1.onNext(1)
        sub1.onNext(1)
        vari.accept(sub2)
        sub2.onNext(2)
        sub1.onCompleted()
        
        descriptionV.text =
        """
        //toArray
        Observable.of(1,2,3)
        .toArray()
        .subscribe({ev in
        debugPrint(ev)
        })
        .disposed(by: disposeBag)
        //reduce
        Observable.of(1,2,3,4,5)
        .reduce(0, accumulator: +)
        .subscribe { (value) in
        debugPrint(value)
        }
        .disposed(by: disposeBag)
        
        let sub1 = BehaviorSubject.init(value: 1)
        let sub2 = BehaviorSubject.init(value: 2)
        
        //concatconcat 会把多个 Observable 序列合并（串联）为一个 Observable 序列。
        // 并且只有当前面一个 Observable 序列发出了 completed 事件，才会开始发送下一个 Observable 序列事件。
        let vari = BehaviorRelay.init(value: sub1)
        vari.concat()
        .subscribe({
        debugPrint($0)
        })
        .disposed(by: disposeBag)
        sub1.onNext(1)
        sub1.onNext(1)
        vari.accept(sub2)
        sub2.onNext(2)
        sub1.onCompleted()
        """
        
    }

}
