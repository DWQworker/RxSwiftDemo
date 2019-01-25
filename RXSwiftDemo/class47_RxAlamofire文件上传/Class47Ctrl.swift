//
//  Class47Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/24.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxAlamofire

class Class47Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class47Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //需要上传的文件路径
        let fileURL = Bundle.main.url(forResource: "weixin", withExtension: "mp3")
        //服务器路径
        let uploadURL = URL(string: "http://www.hangge.com/upload.php")!
        
//        //将文件上传到服务器
//        upload(fileURL!, urlRequest: try! urlRequest(.post, uploadURL))
//            .subscribe(onCompleted: {
//                debugPrint("上传完毕!")
//            })
//            .disposed(by: disposeBag)
        
        
        
        //将文件上传到服务器
        upload(fileURL!, urlRequest: try! urlRequest(.post, uploadURL))
            .subscribe(onNext: { element in
                print("--- 开始上传 ---")
                element.uploadProgress(closure: { (progress) in
                    print("当前进度：\(progress.fractionCompleted)")
                    print("  已上传载：\(progress.completedUnitCount/1024)KB")
                    print("  总大小：\(progress.totalUnitCount/1024)KB")
                })
            }, onError: { error in
                print("上传失败! 失败原因：\(error)")
            }, onCompleted: {
                print("上传完毕!")
            })
            .disposed(by: disposeBag)
    }

}
