//
//  Class3Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/19.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class3Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class3Ctrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //1.just
        Observable.just([1,2,3]).subscribe({
            event in
            debugPrint("\(event) \(String(describing: Thread.current))")
            
            
        }).disposed(by: disposeBag)
        
        Observable.just("dsj", scheduler: MainScheduler.instance).subscribe { (event) in
            debugPrint("\(event) \(String(describing: Thread.current))")
        }.disposed(by: disposeBag)
        /*
         "next([1, 2, 3]) <NSThread: 0x600000063900>{number = 1, name = main}"
         "completed <NSThread: 0x600000063900>{number = 1, name = main}"
         "next(dsj) <NSThread: 0x600000063900>{number = 1, name = main}"
         */
        
        
        //2.of
        Observable.of("a","b","c").subscribe(onNext: { (value) in
            debugPrint(value)
        }, onError: { (err) in
            debugPrint(err)
        }, onCompleted: {
            debugPrint("of 完成")
        }).disposed(by: disposeBag)
        /*
         "a"
         "b"
         "c"
         "of 完成"
         */
        
        //3.from
        Observable.from(["A","B","C"]).subscribe({
            event in
            debugPrint(event)
        }).disposed(by: disposeBag)
        /*
         next(A)
         next(B)
         next(C)
         completed
         "completed <NSThread: 0x600000063900>{number = 1, name = main}"
         */
        
        //4.empty 空序列
//        Observable<Any>.empty().subscribe().disposed(by: disposeBag)
        
        //5.never 永远不会发出 Event（也不会终止）
//        Observable<Any>.never().subscribe().disposed(by: disposeBag)
        
        //6.error
        enum Myerror :Error
        {
            case A,B
        }
//        Observable<Any>.error(Myerror.A).subscribe().disposed(by: disposeBag)
        
//        //7.rang
        Observable.range(start: 1, count: 10).subscribe{
            ev in
            debugPrint(ev)
            }.disposed(by: disposeBag)
//
//        //8.reaptElement
//        Observable.repeatElement("dsj").subscribe({
//            ev in
//            debugPrint(ev)
//        }).disposed(by: disposeBag)
//
        //9. generate
        Observable.generate(initialState: 0, condition: {$0 < 10}, iterate: {$0 + 2}).subscribe({
                        ev in
                        debugPrint(ev)
                    }).disposed(by: disposeBag)
//        //10.create
        Observable<String>.create { (observer) -> Disposable in
            observer.onNext("d")
            observer.onNext("s")
            observer.onNext("j")
            observer.onCompleted()

               return Disposables.create()

            }.subscribe {
                debugPrint($0)
            }

        //11.deffer
         var isTrue = false

      let ob =  Observable<Int>.deferred {
            isTrue = !isTrue
            if isTrue
            {
                return Observable.of(1,2,3)
            }
            else
            {
                return Observable.from([4,5,6])
            }
        }

        ob.subscribe({
            ev in
            debugPrint(ev)
        }).disposed(by: disposeBag)

        ob.subscribe({
            ev in
            debugPrint(ev)
        }).disposed(by: disposeBag)

//        //12.interval 一秒 增加一个 序列数
//        Observable<Int>.interval(1, scheduler: MainScheduler.instance).subscribe({
//            ev in
//            debugPrint(ev)
//        }).disposed(by: disposeBag)
//
        //13.timer
        Observable<Int>.timer(1, scheduler: MainScheduler.instance).subscribe{
            ev in
            debugPrint(ev)
            }.disposed(by: disposeBag)

        Observable<Int>.timer(1, period: 5, scheduler: MainScheduler.instance).subscribe{
            ev in
            debugPrint(ev)
        }.disposed(by: disposeBag)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        descriptionV.text =
        """
        //1.just
        Observable.just([1,2,3]).subscribe({
        event in

        
        
        }).disposed(by: disposeBag)
        
        Observable.just("dsj", scheduler: MainScheduler.instance).subscribe { (event) in

        }.disposed(by: disposeBag)
        /*
        "next([1, 2, 3]) <NSThread: 0x600000063900>{number = 1, name = main}"
        "completed <NSThread: 0x600000063900>{number = 1, name = main}"
        "next(dsj) <NSThread: 0x600000063900>{number = 1, name = main}"
        */
        
        
        //2.of
        Observable.of("a","b","c").subscribe(onNext: { (value) in
        debugPrint(value)
        }, onError: { (err) in
        debugPrint(err)
        }, onCompleted: {
        debugPrint("of 完成")
        }).disposed(by: disposeBag)
        /*
        "a"
        "b"
        "c"
        "of 完成"
        */
        
        //3.from
        Observable.from(["A","B","C"]).subscribe({
        event in
        debugPrint(event)
        }).disposed(by: disposeBag)
        /*
        next(A)
        next(B)
        next(C)
        completed
        "completed <NSThread: 0x600000063900>{number = 1, name = main}"
        */
        
        //4.empty 空序列
        //        Observable<Any>.empty().subscribe().disposed(by: disposeBag)
        
        //5.never 永远不会发出 Event（也不会终止）
        //        Observable<Any>.never().subscribe().disposed(by: disposeBag)
        
        //6.error
        enum Myerror :Error
        {
        case A,B
        }
        //        Observable<Any>.error(Myerror.A).subscribe().disposed(by: disposeBag)
        
        //        //7.rang
        Observable.range(start: 1, count: 10).subscribe{
        ev in
        debugPrint(ev)
        }.disposed(by: disposeBag)
        //
        //        //8.reaptElement
        //        Observable.repeatElement("dsj").subscribe({
        //            ev in
        //            debugPrint(ev)
        //        }).disposed(by: disposeBag)
        //
        //9. generate
        Observable.generate(initialState: 0, condition: {$0 < 10}, iterate: {$0 + 2}).subscribe({
        ev in
        debugPrint(ev)
        }).disposed(by: disposeBag)
        //        //10.create
        Observable<String>.create { (observer) -> Disposable in
        observer.onNext("d")
        observer.onNext("s")
        observer.onNext("j")
        observer.onCompleted()
        
        return Disposables.create()
        
        }.subscribe {
        debugPrint($0)
        }
        
        //11.deffer
        var isTrue = false
        
        let ob =  Observable<Int>.deferred {
        isTrue = !isTrue
        if isTrue
        {
        return Observable.of(1,2,3)
        }
        else
        {
        return Observable.from([4,5,6])
        }
        }
        
        ob.subscribe({
        ev in
        debugPrint(ev)
        }).disposed(by: disposeBag)
        
        ob.subscribe({
        ev in
        debugPrint(ev)
        }).disposed(by: disposeBag)
        
        //        //12.interval 一秒 增加一个 序列数
        //        Observable<Int>.interval(1, scheduler: MainScheduler.instance).subscribe({
        //            ev in
        //            debugPrint(ev)
        //        }).disposed(by: disposeBag)
        //
        //13.timer
        Observable<Int>.timer(1, scheduler: MainScheduler.instance).subscribe{
        ev in
        debugPrint(ev)
        }.disposed(by: disposeBag)
        
        Observable<Int>.timer(1, period: 5, scheduler: MainScheduler.instance).subscribe{
        ev in
        debugPrint(ev)
        }.disposed(by: disposeBag)
        
        """
    }
    
    
    

}
