//
//  Class9Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/20.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit

import RxSwift

class Class9Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class9Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //filter
//        let ob =  Observable.of(1,2,3,4,5,5,6)
//
//        ob.filter { $0 > 3
//            }
//            .subscribe{debugPrint($0)}
//            .disposed(by: disposeBag)
//
//        //distinctUntilChanged 去重
//        ob.distinctUntilChanged()
//            .subscribe{debugPrint($0)}
//            .disposed(by: disposeBag)
//
//        //single 限制只发送一次事件，或者满足条件的第一个事件。
//        //如果存在有多个事件或者没有事件都会发出一个 error 事件。
//        //如果只有一个事件，则不会发出 error 事件。
//        ob.single()
//            .subscribe{
//                debugPrint($0)
//        }
//        .disposed(by: disposeBag)
//
//        ob.single{$0 == 2}
//            .subscribe{
//                debugPrint($0)
//        }
//        .disposed(by: disposeBag)
//
//        //elementAt 取对应下标事件
//        ob.elementAt(4)
//            .subscribe( onNext:{
//                debugPrint($0)
//            })
//        .disposed(by: disposeBag)
//        //ignoreElements  如果我们并不关心 Observable 的任何元素，只想知道 Observable 在什么时候终止，那就可以使用 ignoreElements 操作符。
//        ob.ignoreElements()
//            .subscribe({
//                debugPrint($0)
//            })
//            .disposed(by:disposeBag)
//
//        //take 按顺序取几个事件
//        ob.take(3)
//        .subscribe(
//        {
//                debugPrint($0)
//        })
//        .disposed(by: disposeBag)
//
//        //takeLast  取后 n 个
//        ob.takeLast(2)
//            .subscribe({
//                debugPrint($0)
//            })
//        .disposed(by: disposeBag)
//
//        //skip 跳过 n 个
//        ob.skip(3)
//        .subscribe({
//            debugPrint("skin")
//            debugPrint($0)
//        })
//        .disposed(by: disposeBag)
//
//        let notifi = PublishSubject<String>.init()
//        let source = PublishSubject<Int>.init()
//        //sample 每当收到 notifier 事件，就会从源序列取一个最新的事件并发送。而如果两次 notifier 事件之间没有源序列的事件，则不发送值。
//        source.sample(notifi)
//        .subscribe({
//             debugPrint("sample")
//            debugPrint($0)
//        })
//        .disposed(by: disposeBag)
//
//        source.onNext(1)
//        notifi.onNext("a")
//        source.onNext(2)
//        source.onNext(3)
//        notifi.onNext("b")
//        notifi.onNext("c")
//        source.onNext(2)
//        notifi.onCompleted()
//
//        //定义好每个事件里的值以及发送的时间
//        let items = [
//            [ "value": 1, "time": 0.1 ],
//            [ "value": 2, "time": 1.1 ],
//            [ "value": 3, "time": 1.2 ],
//            [ "value": 4, "time": 1.2 ],
//            [ "value": 5, "time": 1.4 ],
//            [ "value": 6, "time": 2.1 ],
//        ]
//        //debounce
//        Observable.from(items)
//        .flatMap
//            { item in
//                return Observable.of(Int(item["value"]!))
//                    .delaySubscription(Double(item["time"]!),scheduler: MainScheduler.instance)
//            }
//        .debounce(0.5, scheduler: MainScheduler.instance) //只发出与下一个间隔超过0.5秒的元素
//            .subscribe(onNext: {
//                debugPrint("debounce")
//                debugPrint($0) })
//            .disposed(by: disposeBag)
        
        descriptionV.text =
        """
        //        //filter
        //        let ob =  Observable.of(1,2,3,4,5,5,6)
        //
        //        ob.filter { $0 > 3
        //            }
        //            .subscribe{debugPrint($0)}
        //            .disposed(by: disposeBag)
        //
        //        //distinctUntilChanged 去重
        //        ob.distinctUntilChanged()
        //            .subscribe{debugPrint($0)}
        //            .disposed(by: disposeBag)
        //
        //        //single 限制只发送一次事件，或者满足条件的第一个事件。
        //        //如果存在有多个事件或者没有事件都会发出一个 error 事件。
        //        //如果只有一个事件，则不会发出 error 事件。
        //        ob.single()
        //            .subscribe{
        //                debugPrint($0)
        //        }
        //        .disposed(by: disposeBag)
        //
        //        ob.single{$0 == 2}
        //            .subscribe{
        //                debugPrint($0)
        //        }
        //        .disposed(by: disposeBag)
        //
        //        //elementAt 取对应下标事件
        //        ob.elementAt(4)
        //            .subscribe( onNext:{
        //                debugPrint($0)
        //            })
        //        .disposed(by: disposeBag)
        //        //ignoreElements  如果我们并不关心 Observable 的任何元素，只想知道 Observable 在什么时候终止，那就可以使用 ignoreElements 操作符。
        //        ob.ignoreElements()
        //            .subscribe({
        //                debugPrint($0)
        //            })
        //            .disposed(by:disposeBag)
        //
        //        //take 按顺序取几个事件
        //        ob.take(3)
        //        .subscribe(
        //        {
        //                debugPrint($0)
        //        })
        //        .disposed(by: disposeBag)
        //
        //        //takeLast  取后 n 个
        //        ob.takeLast(2)
        //            .subscribe({
        //                debugPrint($0)
        //            })
        //        .disposed(by: disposeBag)
        //
        //        //skip 跳过 n 个
        //        ob.skip(3)
        //        .subscribe({
        //            debugPrint("skin")
        //            debugPrint($0)
        //        })
        //        .disposed(by: disposeBag)
        //
        //        let notifi = PublishSubject<String>.init()
        //        let source = PublishSubject<Int>.init()
        //        //sample 每当收到 notifier 事件，就会从源序列取一个最新的事件并发送。而如果两次 notifier 事件之间没有源序列的事件，则不发送值。
        //        source.sample(notifi)
        //        .subscribe({
        //             debugPrint("sample")
        //            debugPrint($0)
        //        })
        //        .disposed(by: disposeBag)
        //
        //        source.onNext(1)
        //        notifi.onNext("a")
        //        source.onNext(2)
        //        source.onNext(3)
        //        notifi.onNext("b")
        //        notifi.onNext("c")
        //        source.onNext(2)
        //        notifi.onCompleted()
        //
        //        //定义好每个事件里的值以及发送的时间
        //        let items = [
        //            [ "value": 1, "time": 0.1 ],
        //            [ "value": 2, "time": 1.1 ],
        //            [ "value": 3, "time": 1.2 ],
        //            [ "value": 4, "time": 1.2 ],
        //            [ "value": 5, "time": 1.4 ],
        //            [ "value": 6, "time": 2.1 ],
        //        ]
        //        //debounce
        //        Observable.from(items)
        //        .flatMap
        //            { item in
        //                return Observable.of(Int(item["value"]!))
        //                    .delaySubscription(Double(item["time"]!),scheduler: MainScheduler.instance)
        //            }
        //        .debounce(0.5, scheduler: MainScheduler.instance) //只发出与下一个间隔超过0.5秒的元素
        //            .subscribe(onNext: {
        //                debugPrint("debounce")
        //                debugPrint($0) })
        //            .disposed(by: disposeBag)
        """
    
    }
        
        
        
        
        
        

}
