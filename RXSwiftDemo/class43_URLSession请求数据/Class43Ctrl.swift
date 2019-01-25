//
//  Class43Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/24.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import  RxCocoa
import RxSwift
import RxDataSources

class Class43Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class43Ctrl
    }
    
    lazy var startRequestBtn :UIButton = {
        let btn = UIButton.init(frame: CGRect.init(x: 20, y: 80, width: 60, height: 45))
        btn.setTitle("请求数据", for: .normal)
        self.view.addSubview(btn)
          btn.backgroundColor = UIColor.green
        return btn
    }()
    
    lazy var stopRequestBtn :UIButton = {
        let btn = UIButton.init(frame: CGRect.init(x: 20, y: 250, width: 60, height: 45))
        btn.setTitle("停止请求", for: .normal)
        btn.backgroundColor = UIColor.green
        self.view.addSubview(btn)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRequestBtn.setTitle("stop", for: .normal)
        
        let request = URLRequest.init(url: URL.init(string: "https://www.douban.com/j/app/radio/channels")!)
        
//        URLSession.shared.rx.response(request: request)
//            .subscribe(onNext:{(respose,data) in
//
//                if  200...300 ~= respose.statusCode//范围内
//                {
//                debugPrint("==\(respose) ,\(data)")
//
//                 let result = String.init(data: data, encoding: String.Encoding.utf8)
//                    debugPrint(result)
//                }
//            })
//        .disposed(by: disposeBag)
        
//        URLSession.shared.rx.data(request: request)
//            .subscribe(onNext:{(data) in
//
//                    let result = String.init(data: data, encoding: String.Encoding.utf8)
//                    debugPrint(result)
//
//            },onError:{err in
//                debugPrint(err)
//            })
//            .disposed(by: disposeBag)
        
        
        startRequestBtn.rx.tap.asObservable()
            .flatMap{
                URLSession.shared.rx.data(request: request)
                 .takeUntil(self.stopRequestBtn.rx.tap)
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self]  data in
                let result = String.init(data: data , encoding: String.Encoding.utf8)
                debugPrint(result)
//                DispatchQueue.main.async {
                  self?.descriptionV.text = result
//                }
                
            }, onError: { (err) in
                debugPrint(err)
            }, onCompleted: {
                debugPrint("====onCompleted========")
            }) {
                debugPrint("disposed ===")
        }.disposed(by: disposeBag)

        
    }
}
