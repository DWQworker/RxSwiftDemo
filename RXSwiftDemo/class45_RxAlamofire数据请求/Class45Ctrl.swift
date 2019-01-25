//
//  Class45Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/24.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import  RxCocoa
import RxSwift
import RxDataSources
import RxAlamofire

class Class45Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class45Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL.init(string: "https://www.douban.com/j/app/radio/channels")!
        
        //创建并发起请求
//        request(.get, url)
//            .responseString()//data()
//            .subscribe(onNext: {
//                result  in
//                debugPrint(result)
//                //数据处理
////                let str = String(data: data, encoding: String.Encoding.utf8)
////                debugPrint("返回的数据是：", str ?? "")
//            }, onError: { error in
//                debugPrint("请求失败！错误原因：", error)
//            }).disposed(by: disposeBag)
        
//        requestData(.get , url)
//            .observeOn(MainScheduler.instance)
//            .subscribe(onNext:{[weak self ] (respone ,data) in
//
//                if 200..<300 ~= respone.statusCode
//                {
//                    let result = String.init(data: data, encoding: String.Encoding.utf8)
//                    self?.descriptionV.text = result ?? "error"
//                      debugPrint(result)
//
//                }
//
//            })
//        .disposed(by: disposeBag)
        
        
         requestString(.get , url)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext:{[weak self] value in
                debugPrint(value.1)
                self?.descriptionV.text = value.1
            })
        .disposed(by: disposeBag)
        

    }

}
