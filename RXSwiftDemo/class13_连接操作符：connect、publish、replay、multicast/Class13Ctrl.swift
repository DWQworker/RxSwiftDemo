//
//  Class13Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/21.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift

class Class13Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class13Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   //
//        let interval = Observable<Int>.interval(1, scheduler: MainScheduler.init())
//
//        interval.subscribe({
//            debugPrint($0)
//        })
//        .disposed(by: disposeBag)
//
//        delay(5) {
//            interval.subscribe({
//                debugPrint($0)
//            })
//                .disposed(by: self.disposeBag)
//        }
        
        //publish publish 方法会将一个正常的序列转换成一个可连接的序列。同时该序列不会立刻发送事件，只有在调用 connect 之后才会开始。
    
//        let  interval = Observable<Int>.interval(1, scheduler: MainScheduler.init())
//                       .publish()//连续序列
//
//        interval.subscribe({
//            debugPrint($0)
//        })
//            .disposed(by: disposeBag)
//        //相当于把事件消息推迟了两秒
//        delay(2) {
//            _ = interval.connect()
//        }
//
//        delay(5) {
//            interval.subscribe({
//                debugPrint($0)
//            })
//                .disposed(by: self.disposeBag)
//        }
        //replay 可回放 n 个时间 的连续序列
//        let  interval = Observable<Int>.interval(1, scheduler: MainScheduler.init())
//            .replay(3)//连续序列
//
//        interval.subscribe({
//            debugPrint($0)
//        })
//            .disposed(by: disposeBag)
//         interval.connect()
//
//        delay(3) {
//            interval.subscribe({
//                debugPrint($0)
//            })
//                .disposed(by: self.disposeBag)
//        }
        //multicast 方法同样是将一个正常的序列转换成一个可连接的序列。
       
//        let subject = PublishSubject<Int>.init()
//            subject.subscribe({
//                debugPrint("subject: \($0)")
//            }).disposed(by: disposeBag)
//        let interval = Observable.interval(1, scheduler: MainScheduler.instance)
//                       .multicast(subject)
//        interval.connect()
//        interval.subscribe({
//            debugPrint($0)
//        })
//        .disposed(by: disposeBag)
//
        
        //refCount 操作符可以将可被连接的 Observable 转换为普通 Observable
       // 即该操作符可以自动连接和断开可连接的 Observable。当第一个观察者对可连接的 Observable 订阅时，那么底层的 Observable 将被自动连接。当最后一个观察者离开时，那么底层的 Observable 将被自动断开连接。
//        let  interval = Observable<Int>.interval(1, scheduler: MainScheduler.init())
//                    .publish()//连续序列
//                    .refCount()
//
//
//           interval.subscribe({
//            debugPrint($0)
//           })
//        .disposed(by: disposeBag)
//
//        delay(5) {
//            interval.subscribe({
//                debugPrint($0)
//            })
//                .disposed(by: self.disposeBag)
//        }
//
        
        //该操作符将使得观察者共享源 Observable，并且缓存最新的 n 个元素，将这些元素直接发送给新的观察者。
       // 简单来说 shareReplay 就是 replay 和 refCount 的组合。
        let  interval = Observable<Int>.interval(1, scheduler: MainScheduler.init())
            .share(replay: 5, scope: .forever)
        
        
        interval.subscribe({
            debugPrint($0)
        })
            .disposed(by: disposeBag)
        
        delay(5) {
            interval.subscribe({
                debugPrint($0)
            })
                .disposed(by: self.disposeBag)
        }
        
        
        
    }
    
    func delay(_ delay:Double,closure:@escaping () -> Void)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }

}
