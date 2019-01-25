//
//  ClassBaseCtrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/19.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import DQWebKit

let CellId = "MyCell"

class ClassBaseCtrl: UIViewController {
    
    var  webUrl:String?
    {
        return WebUrl.Class1Ctrl
    }//原文网址
    let disposeBag = DisposeBag()
    
    lazy var descriptionV:UITextView = {
        
        let dv = UITextView.init(frame: self.view.frame)
        dv.contentInsetAdjustmentBehavior = .always
//        dv.textAlignment = .center
        self.view.addSubview(dv)
        return dv
    }()
    
    
    lazy var tableV: UITableView = {
        let tv = UITableView.init(frame: self.view.frame, style: .plain)
        tv.contentInsetAdjustmentBehavior = .always
        tv.register(UINib.init(nibName: CellId, bundle: nil), forCellReuseIdentifier: CellId)
        
        self.view.addSubview(tv)
        return tv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let tap = UITapGestureRecognizer.init()
             tap.numberOfTapsRequired = 1
             tap.numberOfTouchesRequired = 1
        
        self.navigationController?.navigationBar.addGestureRecognizer(tap)
        
        
        
        tap.rx.event
            .throttle(1, scheduler: MainScheduler.instance)
            .subscribe({ [weak self]  _ in
             self?.loadHtml()
        })
        .disposed(by: disposeBag)
        
        
    }
    
   private func loadHtml()
    {
        guard webUrl != nil , webUrl?.isEmpty == false  else {
            debugPrint("链接为空或者为 nil")
            return
        }
        let webCtrl = DQWebViewController()
         webCtrl.urlString = webUrl
        self.navigationController?.pushViewController(webCtrl, animated: true)
    }
    
}
