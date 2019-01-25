//
//  Class33Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/24.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import  RxCocoa
import RxSwift
import RxDataSources

class Class33Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class33Ctrl
    }
    lazy var searchBar:UISearchBar = {
        let sb = UISearchBar.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 56))
        self.tableV.tableHeaderView = sb
        return sb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "刷新", style: .plain, target: nil , action: nil)
        
        let random =  self.navigationItem.rightBarButtonItem?.rx.tap.asObservable()
                            .startWith(()) //加这个为了让一开始就能自动请求一次数据
                            .flatMapLatest(getData) //获取数据
                            .flatMap(filterResult) //筛选数据
                            .share(replay: 1)
        
        let datasource = RxTableViewSectionedReloadDataSource<SectionModel<String,Int>>(configureCell: {(ds, tableView , idx, element) -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
                 cell?.textLabel?.text = "\(element)"
               return cell!
        })
        
        random?.bind(to: tableV.rx.items(dataSource: datasource))
        .disposed(by: disposeBag)
      
    }
    
    //MARK:获取随机数
    func getData() -> Observable<[SectionModel<String,Int>]>
    {
        debugPrint("正在获取 数据")
        
        let items = (1..<5).map {_ in
            Int(arc4random())
           
        }
        
        return Observable.just([SectionModel.init(model: "dsj", items: items)]).delay(2, scheduler: MainScheduler.instance)
    }
    
    //MARK:筛选
    func filterResult(data:[SectionModel<String, Int>])
        -> Observable<[SectionModel<String, Int>]> {
            return self.searchBar.rx.text.orEmpty
                .debounce(0.5, scheduler: MainScheduler.instance) //只有间隔超过0.5秒才发送
                .flatMapLatest{
                    query -> Observable<[SectionModel<String, Int>]> in
                    print("正在筛选数据（条件为：\(query)）")
                    //输入条件为空，则直接返回原始数据
                    if query.isEmpty{
                        return Observable.just(data)
                    }
                        //输入条件为不空，则只返回包含有该文字的数据
                    else{
                        var newData:[SectionModel<String, Int>] = []
                        
                        for sectionModel in data {
                            let items = sectionModel.items.filter{ "\($0)".contains(query) }
                            newData.append(SectionModel(model: sectionModel.model, items: items))
                        }
                        return Observable.just(newData)
                    }
            }
    }
}
