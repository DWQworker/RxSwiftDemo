//
//  Class15Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class15Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class15Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        enum MyError:Error
        {
            case A,B
        }
        
        let subject = PublishSubject<Int>.init()
        
        subject
            .catchErrorJustReturn(-1)
            .subscribe({
            debugPrint(debugPrint($0))
        })
        .disposed(by: disposeBag)
        subject.onNext(1)
        subject.onNext(2)
        subject.onError(MyError.A)
        
        let ob = Observable.of(1,2,3)
        
        let sub = PublishSubject<Int>.init()
        sub.catchError
            {
                debugPrint($0)
                return ob
        }
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        sub.onNext(4)
        sub.onNext(5)
        sub.onError(MyError.B)
        
        var count = 1
        let sub1 = Observable<Int>.create{sub in
            
          
            
            sub.onNext(1)
            sub.onNext(2)
            if count == 1 {
                sub.onError(MyError.A)
                count += 1
            }
            sub.onNext(3)
            sub.onNext(4)
         return Disposables.create()
        }
        
        sub1.retry(2)
            .subscribe({
                debugPrint($0)
            })
            .disposed(by: disposeBag)
        
        
     
        
        
    }

}
