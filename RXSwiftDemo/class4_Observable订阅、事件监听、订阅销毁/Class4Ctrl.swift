//
//  Class4Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/19.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift

class Class4Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class4Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       //订阅1
        Observable.of("a","b","c").subscribe{
            ev in
            debugPrint(ev)
            debugPrint(ev.element)
        }.disposed(by: disposeBag)
        
        //订阅2
        Observable.of("1","2","3").subscribe(onNext: { (value) in
            debugPrint(value)
        }, onError: { (err) in
            debugPrint(err)
        }, onCompleted: {
            debugPrint("completed")
        }) {
            debugPrint("订阅2==dispose")
        }.dispose()
        
        //DO
        Observable.of("d","s","j").do(onNext: { (value) in
            debugPrint(value)
        }, onError: { (err) in
            
        }, onCompleted: {
            debugPrint("completed")
        }, onSubscribe: {
            debugPrint("subscribe")
        }, onSubscribed: {
            debugPrint("Subscribed")
        }) {
            debugPrint("dispose")
            }.subscribe { (ev) in
                debugPrint(ev)
        }.disposed(by: disposeBag)
        
        //销毁
        let ob = Observable.of("dd","ss","jj")
        
        ob.subscribe { (ev ) in
            debugPrint(ev)
        }.dispose()
        
        ob.subscribe{ev in
            debugPrint("第二次订阅 \(ev)")
             }.disposed(by: disposeBag)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        descriptionV.text =
        """
        //订阅1
        Observable.of("a","b","c").subscribe{
        ev in
        debugPrint(ev)
        debugPrint(ev.element)
        }.disposed(by: disposeBag)
        
        //订阅2
        Observable.of("1","2","3").subscribe(onNext: { (value) in
        debugPrint(value)
        }, onError: { (err) in
        debugPrint(err)
        }, onCompleted: {
        debugPrint("completed")
        }) {
        debugPrint("订阅2==dispose")
        }.dispose()
        
        //DO
        Observable.of("d","s","j").do(onNext: { (value) in
        debugPrint(value)
        }, onError: { (err) in
        
        }, onCompleted: {
        debugPrint("completed")
        }, onSubscribe: {
        debugPrint("subscribe")
        }, onSubscribed: {
        debugPrint("Subscribed")
        }) {
        debugPrint("dispose")
        }.subscribe { (ev) in
        debugPrint(ev)
        }.disposed(by: disposeBag)
        
        //销毁
        let ob = Observable.of("dd","ss","jj")
        
        ob.subscribe { (ev ) in
        debugPrint(ev)
        }.dispose()
        
        ob.subscribe{ev in
        debugPrint("第二次订阅 ")
        }.disposed(by: disposeBag)
        
        """
    }

}
