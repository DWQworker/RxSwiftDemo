//
//  Class10Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/20.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift

class Class10Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class10Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //amb 当传入多个 Observables 到 amb 操作符时，它将取第一个发出元素或产生事件的 Observable，然后只发出它的元素。并忽略掉其他的 Observables。
        let subject = PublishSubject<Any>.init()
        let subject1 = PublishSubject<Any>.init()
        let subject2 = PublishSubject<Any>.init()

        subject.amb(subject1)
        .amb(subject2)
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        subject1.onNext(1)
        subject.onNext(11)
        subject2.onNext(111)
        subject2.onNext(222)
        subject1.onNext(2)
        subject.onNext(22)
        
        //takeWhile 当第一个不满足条件的值出现时，它便自动完成。
      let ob =  Observable.of(1,2,3,4,5)
            
            ob.takeWhile{$0 == 4}
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        //takeUntil 取到通知为止
         let notifi = PublishSubject<String>.init()
        let subject4 = PublishSubject<String>.init()
        subject4.takeUntil(notifi)
          .subscribe({
            debugPrint("takeUntil")
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        subject4.onNext("1")
        subject4.onNext("2")
        subject4.onNext("3")
//        notifi.onNext("stop")
        subject4.onNext("4")
        
        //skipWhile 跳过直到xx
        ob.skipWhile{ $0 > 3}
        .subscribe({
            debugPrint("skipWhile")
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        let notifier = PublishSubject<String>.init()
        subject4.skipUntil(notifier)
        .subscribe({
            debugPrint("skipUntil")
            debugPrint($0)
        }).disposed(by: disposeBag)
        
        subject4.onNext("f")
        notifi.onNext("st")
        subject4.onNext("r")
        subject4.onNext("i")
        subject4.onNext("e")
        subject4.onNext("n")
        subject4.onNext("d")
        subject4.onCompleted()
        
        
        
        
        
        
        

    }

}
