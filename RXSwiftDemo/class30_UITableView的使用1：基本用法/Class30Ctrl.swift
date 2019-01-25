//
//  Class30Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/23.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class Class30Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class30Ctrl
    }
    
    var dataArr = Observable.just(["dsj","dxq","dnn"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        dataArr.bind(to: tableV.rx.items){
            (tableView ,row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
            cell?.textLabel?.text = "\(row):\(element)"
            return cell!
        }
        .disposed(by: disposeBag)
        
        
        Observable.zip(tableV.rx.modelSelected(String.self),tableV.rx.itemSelected)
            .subscribe(onNext:{
                model , idx in
                debugPrint("===\(model) ===\(idx)")
            })
            .disposed(by:disposeBag)
        
        Observable.zip(tableV.rx.itemDeselected,tableV.rx.modelDeselected(String.self))
            .subscribe(onNext: { (idx , value) in
                debugPrint(debugPrint("\(idx)=\(value)"))
            })
        .disposed(by: disposeBag)
        
//        tableV.rx.itemDeleted.subscribe(onNext:{ value in
//            debugPrint(value)
//        })
//        .disposed(by: disposeBag)
//
        tableV.rx.itemInserted
        .subscribe(onNext:{ value in
            debugPrint("==itemInserted\(value)")
        })
            .disposed(by: disposeBag)
        
        tableV.rx.willDisplayCell
            .subscribe(onNext:{ value in
                debugPrint("==willDisplayCell\(value)")
            })
            .disposed(by: disposeBag)
        
    }
}
