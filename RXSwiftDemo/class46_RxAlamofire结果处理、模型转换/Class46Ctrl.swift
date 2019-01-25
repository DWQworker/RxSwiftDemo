//
//  Class46Ctrl.swift
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

class Class46Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class46Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL.init(string: "https://www.douban.com/j/app/radio/channels")!

        requestString(.get , url)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext:{[weak self] value in
                debugPrint(value.1)
                self?.descriptionV.text = value.1
            })
            .disposed(by: disposeBag)
    }

}
