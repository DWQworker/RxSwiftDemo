//
//  Class8Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/19.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Class8Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class8Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let subject = PublishSubject<String>()
    //buffer
        subject.buffer(timeSpan: 1, count: 3, scheduler: MainScheduler.instance)
            .subscribe{
                debugPrint($0)
        }
        .disposed(by: disposeBag)
        
        //window
//        subject.window(timeSpan: 1, count: 3, scheduler: MainScheduler.instance)
//            .subscribe{ [weak self] in
//                debugPrint($0)
//                $0.asObservable()
//                    .subscribe(onNext: { print($0) })
//                    .disposed(by: self!.disposeBag)
//        }.disposed(by: disposeBag)
        
        //Map
        subject.map{ $0 + "="}
        .subscribe({
            debugPrint($0)
        }).disposed(by: disposeBag)
        
        subject.onNext("a")
        subject.onNext("b")
        subject.onNext("c")
        subject.onNext("d")
        
        let subject1 = BehaviorSubject.init(value: "A")
        let subject2 = BehaviorSubject.init(value: "1")
        
        let subject3 = BehaviorRelay.init(value: subject1)
        let vaiable = Variable.init(subject1)
        //flatMap 降维
        subject3.flatMap{ $0 }
            .subscribe{
                debugPrint($0)
        }
        .disposed(by: disposeBag)
        
        subject1.onNext("B")
        subject2.onNext("2")
        
        vaiable.value = subject2
        //flatMapLatest
        vaiable.asObservable().flatMapLatest{$0}
            .subscribe{
                debugPrint($0)
        }
        .disposed(by: disposeBag)
        
        //flatMapFirst
        vaiable.asObservable().flatMapFirst{$0}
            .subscribe{
                debugPrint($0)
            }
            .disposed(by: disposeBag)
        //concatMap
        vaiable.asObservable().concatMap{$0}
            .subscribe{debugPrint($0)}
        .disposed(by: disposeBag)
        
        //scan
        Observable.of(1,2,3,4)
        .scan(0) { (a, b) in
                a + b
        }
            .subscribe{
                debugPrint($0)
        }
        .disposed(by: disposeBag)
        
        Observable<Int>.of(5,6,7,8)
        .groupBy { (element) -> String in
                return element % 2 != 0 ? "奇数":"偶数"
        }
        .subscribe{ [weak self] (event) in
                switch event {
                case .next(let group):
                    group.asObservable().subscribe({ (event) in
                        debugPrint("key：\(group.key)    event：\(event)")
                    })
                        .disposed(by: (self?.disposeBag)!)
                default:
                    print("")
                }
        }
        .disposed(by: disposeBag)
        
        
        descriptionV.text =
        """
        let subject = PublishSubject<String>()
        //buffer
        subject.buffer(timeSpan: 1, count: 3, scheduler: MainScheduler.instance)
        .subscribe{
        debugPrint($0)
        }
        .disposed(by: disposeBag)
        
        //window
        //        subject.window(timeSpan: 1, count: 3, scheduler: MainScheduler.instance)
        //            .subscribe{ [weak self] in
        //                debugPrint($0)
        //                $0.asObservable()
        //                    .subscribe(onNext: { print($0) })
        //                    .disposed(by: self!.disposeBag)
        //        }.disposed(by: disposeBag)
        
        //Map
        subject.map{ $0 + "="}
        .subscribe({
        debugPrint($0)
        }).disposed(by: disposeBag)
        
        subject.onNext("a")
        subject.onNext("b")
        subject.onNext("c")
        subject.onNext("d")
        
        let subject1 = BehaviorSubject.init(value: "A")
        let subject2 = BehaviorSubject.init(value: "1")
        
        let subject3 = BehaviorRelay.init(value: subject1)
        let vaiable = Variable.init(subject1)
        //flatMap 降维
        subject3.flatMap{ $0 }
        .subscribe{
        debugPrint($0)
        }
        .disposed(by: disposeBag)
        
        subject1.onNext("B")
        subject2.onNext("2")
        
        vaiable.value = subject2
        //flatMapLatest
        vaiable.asObservable().flatMapLatest{$0}
        .subscribe{
        debugPrint($0)
        }
        .disposed(by: disposeBag)
        
        //flatMapFirst
        vaiable.asObservable().flatMapFirst{$0}
        .subscribe{
        debugPrint($0)
        }
        .disposed(by: disposeBag)
        //concatMap
        vaiable.asObservable().concatMap{$0}
        .subscribe{debugPrint($0)}
        .disposed(by: disposeBag)
        
        //scan就是先给一个初始化的数，然后不断的拿前一个结果和最新的值进行处理操作。
        Observable.of(1,2,3,4)
        .scan(0) { (a, b) in
        a + b
        }
        .subscribe{
        debugPrint($0)
        }
        .disposed(by: disposeBag)
        
        Observable<Int>.of(5,6,7,8)
        .groupBy { (element) -> String in
        return element % 2 != 0 ? "奇数":"偶数"
        }
        .subscribe{ [weak self] (event) in
        switch event {
        case .next(let group):
        group.asObservable().subscribe({ (event) in

        })
        .disposed(by: (self?.disposeBag)!)
        default:
        print("")
        }
        }
        .disposed(by: disposeBag)
        """
        
        
        
        
    }
}
