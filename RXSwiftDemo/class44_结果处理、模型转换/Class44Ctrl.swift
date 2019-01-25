//
//  Class44Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/24.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import  RxCocoa
import RxSwift
import RxDataSources

class Class44Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class44Ctrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
                let request = URLRequest.init(url: URL.init(string: "https://www.douban.com/j/app/radio/channels")!)
        
        
        //获取列表数据
        let data = URLSession.shared.rx.json(request: request)
            .map{ result -> [[String: Any]] in
                if let data = result as? [String: Any],
                    let channels = data["channels"] as? [[String: Any]] {
                    return channels
                }else{
                    return []
                }
        }
        
        data.bind(to: tableV.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId)!
            cell.textLabel?.text = "\(row)：\(element["name"]!)"
            return cell
            }.disposed(by: disposeBag)
        
    }
}
