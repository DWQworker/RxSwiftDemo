//
//  Class32Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/23.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class Class32Ctrl: ClassBaseCtrl {
    
    override var  webUrl:String?
    {
        return WebUrl.Class32Ctrl
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
          
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem.init(title: "刷新表格", style: .plain, target: nil, action: nil),UIBarButtonItem.init(title: "stop", style: .plain, target: nil, action: nil)]
        
        
        let random  = self.navigationItem.rightBarButtonItems?.first?.rx.tap.asObservable()
                       .startWith(())
                       .throttle(1, scheduler: MainScheduler.instance)
            .flatMapLatest{ ev in
                self.loadMore().takeUntil(self.navigationItem.rightBarButtonItems!.last!.rx.tap)
                        
            }
                       .share(replay: 1)
        
        
                let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String,Int>>(configureCell: {
                    (data ,tableview ,idx ,item) in
                    let cell = tableview.dequeueReusableCell(withIdentifier: "MyCell")
                       cell?.textLabel?.text = "\(item)"
                    return cell!
                })
        

        dataSource.titleForHeaderInSection = {ds ,idx in
            return ds.sectionModels[idx].model
        }
        
        random?.bind(to: tableV.rx.items(dataSource: dataSource))
            .disposed(by:disposeBag)
        
        
    }
    
     func loadMore() -> Observable<[SectionModel<String, Int>]>
    {
        debugPrint("正在请求")
         let items =  (1..<5).map {_ in
            Int(arc4random())
        }
        
        let ob = Observable.just([SectionModel.init(model: "dsj", items: items)])
         return ob.delay(2, scheduler: MainScheduler.instance)
     }
}
