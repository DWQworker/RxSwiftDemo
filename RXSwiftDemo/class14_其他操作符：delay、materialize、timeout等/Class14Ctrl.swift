//
//  Class14Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/21.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift

class Class14Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class14Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO:😁
        //delay
//        Observable.of(1,2,3)
//        .delay(3, scheduler: MainScheduler.instance)
//        .subscribe(
//            onNext:{
//                debugPrint($0)
//            }
//        ).disposed(by: disposeBag)
//
        
        //delaySubscription
//        Observable.of(1,2,3)
//            .delaySubscription(3, scheduler: MainScheduler.instance)
//            .subscribe(
//                onNext:{
//                    debugPrint($0)
//            }
//            ).disposed(by: disposeBag)
        //materialize
        Observable.of(1,2,3)
            .materialize()
            .subscribe(
                onNext:{
                    debugPrint($0)
            }
            ).disposed(by: disposeBag)
        
        //dematerialize
        Observable.of(1,2,3)
            .materialize()
            .dematerialize()
            .subscribe(
                onNext:{
                    debugPrint($0)
            }
            ).disposed(by: disposeBag)
        //MARK: 😋
        //timeout
        Observable.of(1)
        .delay(3, scheduler: MainScheduler.instance)
        .timeout(2, scheduler: MainScheduler.instance)
            .subscribe(onNext:{
                debugPrint($0)
            },onError:{
                debugPrint($0)
        })
        .disposed(by: disposeBag)
        
//        let ob1 = Observable<Int>.interval(0.1, scheduler: MainScheduler.instance)
//                  .subscribe({
//                    debugPrint($0)
//                  })
//                 .disposed(by: disposeBag)
//
//        let ob2 = Observable<Int>.interval(0.5, scheduler: MainScheduler.instance)
//            .take(2)
//            .subscribe{
//                debugPrint($0)
//            }
//            .disposed(by: disposeBag)
//
//        let ob3 = Observable.using({ () -> Disposable in
//            return AnyDisposable.init()
//        }) { (_) -> Observable<Int> in
//           return ob2
//        }
        
        //MARK:- 一个无限序列（每隔0.1秒创建一个序列数 ）
        let infiniteInterval = Observable<Int>
            .interval(0.1, scheduler: MainScheduler.instance)
            .do(
                onNext: { debugPrint("infinite$: \($0)") },
                onSubscribe: { debugPrint("开始订阅 infinite$")},
                onDispose: { debugPrint("销毁 infinite$")}
        )
        
        let limited = Observable<Int>.interval(0.5, scheduler: MainScheduler.instance)
        .take(2)
            .do(onNext: { debugPrint($0)
            }, onError: { (err) in
                debugPrint(err)
            }, onCompleted: {
                debugPrint("onCompleted")
            }, onSubscribe: {
                debugPrint("onSubscribe")
            }, onSubscribed: {
                debugPrint("onSubscribed")
            }) {
                debugPrint("dispose")
        }
        //FIXME:这里有点问题
        //        let o:Observable<Int> = Observable.using({ () -> Disposable in
//            return AnyDisposable.init(infiniteInterval.subscribe())
//            } as! () -> _ ,observableFactory: {(_) -> Observable<Int> in  return limited }
//        )
//
//        o.subscribe()
        

        
    }
    
    
    
    
    

}

class AnyDisposable:Disposable
{
    let _dispose:()->Void
    init(_ disposable :Disposable) {
        _dispose = disposable.dispose
    }
    
    func dispose() {
        _dispose()
    }
}
