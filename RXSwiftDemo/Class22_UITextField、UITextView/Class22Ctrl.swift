//
//  Class22Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class22Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class22Ctrl
    }
    lazy var tf :UITextField =
        {
            let textfield = UITextField.init(frame: CGRect.init(x: 20, y: 80, width: 100, height: 44))
            textfield.backgroundColor = UIColor.gray
            textfield.placeholder = "请输入..."
            textfield.borderStyle = .roundedRect

            self.view.addSubview(textfield)
            return textfield
    }()
    
    lazy var tf1 :UITextField =
        {
            let textfield = UITextField.init(frame: CGRect.init(x: 20, y: 150, width: 100, height: 44))
            textfield.backgroundColor = UIColor.yellow
            textfield.placeholder = "请输入..."
            textfield.borderStyle = .roundedRect
            self.view.addSubview(textfield)
            return textfield
    }()
    
    lazy var txt :UITextView =
        {
            let textfield = UITextView.init(frame: CGRect.init(x: 20, y: 200, width: 100, height: 44))
            textfield.backgroundColor = UIColor.blue
            
           
            self.view.addSubview(textfield)
            return textfield
    }()
    
    lazy var lb:UILabel = {
        let lable = UILabel.init(frame: CGRect.init(x: 20, y: 250, width: 100, height: 44))
        lable.backgroundColor = UIColor.red
        self.view.addSubview(lable)
        return lable
    }()
    
    override func viewDidLoad() {
        //注意：.orEmpty 可以将 String? 类型的 ControlProperty 转成 String，省得我们再去解包。
        //注意：Throttling 的作用：
       // Throttling 是 RxSwift 的一个特性。因为有时当一些东西改变时，通常会做大量的逻辑操作。而使用 Throttling 特性，不会产生大量的逻辑操作，而是以一个小的合理的幅度去执行。比如做一些实时搜索功能时，这个特性很有用。
     
      
        super.viewDidLoad()
       tf.rx.text.orEmpty.asObservable()
        .throttle(0.3, scheduler: MainScheduler.instance)
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        tf1.rx.text.orEmpty.changed
            .subscribe(onNext: { (value) in
                debugPrint(value)
            })
            .disposed(by: disposeBag)
        
        tf.rx.text.orEmpty.asDriver()
        .throttle(0.3)
        .drive(lb.rx.text)
        .disposed(by: disposeBag)
        
        tf.rx.text.orEmpty.asDriver()
            .throttle(0.3)
            .drive(tf1.rx.text)
            .disposed(by: disposeBag)
        
        Observable.combineLatest(tf.rx.text.orEmpty,tf1.rx.text.orEmpty)
        { txt1,txt2  -> String in
             return txt1 + txt2
        }
        .map {
                $0
        }
        .subscribe({
            debugPrint($0)
        })
        .disposed(by: disposeBag)
        
        tf.rx.controlEvent(.editingDidEndOnExit).subscribe({ [weak self] in
            debugPrint($0)
            
            self?.tf1.becomeFirstResponder()
        })
        .disposed(by: disposeBag)
        
        txt.rx.didEndEditing
        .subscribe({
            debugPrint($0)
        }).disposed(by: disposeBag)
        
        txt.rx.didBeginEditing
        .subscribe({
            debugPrint($0)
        }).disposed(by: disposeBag)
    }

}
