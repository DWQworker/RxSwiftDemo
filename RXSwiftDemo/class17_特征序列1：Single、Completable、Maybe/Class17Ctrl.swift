//
//  Class17Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift

class Class17Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class17Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Single
       Observable.of(1)
        .asSingle()
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        
        
        getData("0")
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        //Completable
        Completable.create { (complete ) -> Disposable in
            
//            complete(CompletableEvent.completed)
            complete(CompletableEvent.error(DataError.B))
            return Disposables.create()
        }.subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        //Maybe
        Observable.of(2)
        .asMaybe()
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        Maybe.create { (maybe) -> Disposable in
            maybe(MaybeEvent.success(1))
            return Disposables.create()
        }
            .subscribe(onSuccess: { (value) in
                debugPrint(value)
            }, onError: { (err) in
                debugPrint(err)
            }) {
                debugPrint("completed")
        }
        .disposed(by: disposeBag)
        
    
    }
    
    func getData(_ channel:String) -> Single<[String:Any]> {
        
        return Single.create(subscribe: { (single) -> Disposable in
            
         let url = URL.init(string: "https://douban.fm/j/mine/playlist?"
                + "type=n&channel=\(channel)&from=mainsite")

          let task =  URLSession.shared.dataTask(with: url!, completionHandler: { (data , respon, err) in
                if err != nil
                {
                    single(SingleEvent.error(err!))
                    return
                }
                
                guard let data = data, let json = try? JSONSerialization.jsonObject(with: data , options: .mutableContainers) , let result = json as? [String:Any]
                    
                 else {
                    single(SingleEvent.error(DataError.B))
                        return
                }
                 single(SingleEvent.success(result))
                    
                
            })
            task.resume()
            
            return Disposables.create{ task.cancel()}
        })
    }

}

enum DataError:Error {
    case A,B
}
