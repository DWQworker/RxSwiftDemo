//
//  Class31Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/23.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class Class31Ctrl: ClassBaseCtrl {

    override var  webUrl:String?
    {
        return WebUrl.Class31Ctrl
    }
    
//    let section = Observable.just([
//          SectionModel.init(model: "qq", items: ["abc","def","xyz"]),
//          SectionModel.init(model: "ww", items: ["abc","def","xyz"])
//        ])
    
    let section = Observable.just([
        MySection.init(header: "qq", items: ["abc","def","xyz"]),
        MySection.init(header: "ww", items: ["abc","def","xyz"])
        ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String,String>>(configureCell: {
//            (data ,tableview ,idx ,item) in
//            let cell = tableview.dequeueReusableCell(withIdentifier: "MyCell")
//               cell?.textLabel?.text = item
//            return cell!
//        })
//
                let dataSource = RxTableViewSectionedReloadDataSource<MySection>(configureCell: {
                    (data ,tableview ,idx ,item) in
                    let cell = tableview.dequeueReusableCell(withIdentifier: "MyCell")
                       cell?.textLabel?.text = item
                    return cell!
                })
        
        dataSource.titleForHeaderInSection = {ds ,idx in
            return ds.sectionModels[idx].header
        }
        
        section.bind(to: tableV.rx.items(dataSource: dataSource))
            .disposed(by:disposeBag)
        
        
      }

}
typealias Item  = String

struct MySection {
    var header:String
    var items:[Item]
    
}

extension MySection:AnimatableSectionModelType
{
    var identity: String {
        return header
    }
    
    init(original: MySection, items: [Item]) {
        self = original
        self.items = items
    }
}
