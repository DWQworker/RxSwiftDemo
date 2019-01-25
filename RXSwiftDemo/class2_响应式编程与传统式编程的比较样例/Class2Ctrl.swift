//
//  Class2Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/19.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MJRefresh

class Class2Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class2Ctrl
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let listModel = Observable.just([Musice(songName:"浪子回头",singer:"茄子蛋"),
                                     Musice(songName:"东西",singer:"林俊呈"),
                                     Musice(songName:"说书人",singer:"暗杠")])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        listModel.bind(to: tableView.rx.items(cellIdentifier: "MusicCell")){ _, music ,cell in
            cell.textLabel?.text = music.songName
            cell.detailTextLabel?.text = music.singer

        }.disposed(by: disposeBag)

        tableView.rx.modelSelected(Musice.self).subscribe(onNext: { (music) in
            debugPrint(music)
        }).disposed(by: disposeBag)
        
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            debugPrint("刷新")
            
             self.reload()
        })
        
        
    }
    
    func reload ()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tableView.mj_header.endRefreshing()
        }
        
    }
    
    

}
