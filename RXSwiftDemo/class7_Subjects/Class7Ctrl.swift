//
//  Class7Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/19.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class7Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class7Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //PublishSubject 实时订阅
        let subject1 = PublishSubject<String>()
        subject1.onNext("ddd")
        subject1.subscribe(onNext: { (value) in
            debugPrint("第一次订阅")
            debugPrint(value)
        })
        .disposed(by: disposeBag)
        
        subject1.onNext("sss")
        
        subject1.subscribe(onNext: { (value) in
            debugPrint("第二次订阅")
            debugPrint(value)
        })
            .disposed(by: disposeBag)
          subject1.onNext("jjj")
        subject1.onCompleted()
        
        //BehaviorSubject ,接上一次事件
        let subject2 = BehaviorSubject.init(value: 111)
        subject2.onNext(222)
        subject2.onNext(333)
        subject2.subscribe(onNext: { value  in
            debugPrint("subject2======")
            debugPrint(value)

        })
        .disposed(by: disposeBag)
        subject2.onNext(555)
        subject2.onCompleted()
        
        //ReplaySubject
        let subject3 = ReplaySubject<String>.create(bufferSize: 2)
        
        subject3.onNext("a")
        subject3.onNext("b")
        subject3.onNext("c")
        subject3.onCompleted()
        subject3.subscribe(onNext:{value in
            debugPrint("subject3======")
            debugPrint(value)
        })
        .disposed(by: disposeBag)
        
        //BehaviorRelay 没有 onCompleted()
        let subject4 = BehaviorRelay.init(value: "aaa")
        subject4.accept("bbb")
        subject4.accept(subject4.value + "ccc")
        
        subject4.subscribe(onNext:{ value in
            debugPrint("subject4======")
            debugPrint(value)
        }).disposed(by: disposeBag)
        
        
        descriptionV.text =
        """
        （1）Subjects 既是订阅者，也是 Observable：
        说它是订阅者，是因为它能够动态地接收新的值。
        说它又是一个 Observable，是因为当 Subjects 有了新的值之后，就会通过 Event 将新值发出给他的所有订阅者。
        
        （2）一共有四种 Subjects，分别为：PublishSubject、BehaviorSubject、ReplaySubject、BehaviorRelay。他们之间既有各自的特点，也有相同之处：
        首先他们都是 Observable，他们的订阅者都能收到他们发出的新的 Event。
        直到 Subject 发出 .complete 或者 .error 的 Event 后，该 Subject 便终结了，同时它也就不会再发出 .next 事件。
        对于那些在 Subject 终结后再订阅他的订阅者，也能收到 subject 发出的一条 .complete 或 .error 的 event，告诉这个新的订阅者它已经终结了。
        他们之间最大的区别只是在于：当一个新的订阅者刚订阅它的时候，能不能收到 Subject 以前发出过的旧 Event，如果能的话又能收到多少个。
        
        （3）Subject 常用的几个方法：
        onNext(:)：是 on(.next(:)) 的简便写法。该方法相当于 subject 接收到一个 .next 事件。
        onError(:)：是 on(.error(:)) 的简便写法。该方法相当于 subject 接收到一个 .error 事件。
        onCompleted()：是 on(.completed) 的简便写法。该方法相当于 subject 接收到一个 .completed 事件。
        """
        
    }
}
