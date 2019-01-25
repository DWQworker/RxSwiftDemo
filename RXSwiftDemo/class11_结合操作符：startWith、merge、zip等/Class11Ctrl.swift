//
//  Class11Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/20.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class11Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class11Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       //startWith
   Observable.of(1,2,3)
        .startWith(0)
        .startWith(-1)
        .startWith(-2)
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        //merge
        let sub1 = PublishSubject<Int>.init()
        let sub2 = PublishSubject<Int>.init()
        
        Observable.of(sub1,sub2)
        .merge()
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        sub1.onNext(11)
        sub2.onNext(22)
        sub1.onNext(33)
        sub2.onNext(44)
        
        //zip
        let sub3 = PublishSubject<Int>.init()
        let sub4 = PublishSubject<String>.init()
        Observable.zip(sub3,sub4) {
              "\($0)\($1)"
            }
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        sub3.onNext(1)
        sub4.onNext("d")
        sub3.onNext(2)
        sub4.onNext("s")
        sub3.onNext(3)
        sub4.onNext("j")
        
        //combineLatest 每当任意一个 Observable 有新的事件发出时，它会将每个 Observable 序列的最新的一个事件元素进行合并。
        let sub7 = PublishSubject<Int>.init()
        let sub8 = PublishSubject<String>.init()
        Observable.combineLatest(sub7,sub8){
            "\($0)\($1)"
        }
            .subscribe({
                debugPrint("combineLatest")
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        sub7.onNext(1)
        sub8.onNext("d")
        sub7.onNext(2)
        sub8.onNext("s")
        sub7.onNext(3)
        sub8.onNext("j")
    //withLatestFrom
        sub3.withLatestFrom(sub4)
        .subscribe({
             debugPrint("withLatestFrom")
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        sub3.onNext(1)
        sub4.onNext("D")
        sub4.onNext("S")
        sub4.onNext("J")
        sub3.onNext(2)
        sub3.onNext(3)
        
        let sub5 = BehaviorSubject.init(value: 88)
        let sub6 = BehaviorSubject.init(value: 66)
        
        let varib = BehaviorRelay.init(value: sub5)
        
        varib.switchLatest()
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        sub5.onNext(99)
        sub6.onNext(77)
        varib.accept(sub6)
        sub6.onNext(88)
        sub5.onNext(00)
        
        
        
    }

}
