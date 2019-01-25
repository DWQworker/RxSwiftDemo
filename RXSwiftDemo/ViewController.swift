//
//  ViewController.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/9.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class ViewController: UIViewController
{
    
    //tableView对象
    @IBOutlet weak var tableView: UITableView!
    
    //负责对象销毁
    let disposeBag = DisposeBag()
    
    typealias listItem = (Int,String)
    var listArr = [listItem]()
    
    var classNameArr = ["基本介绍、安装配置",
                        "响应式编程与传统式编程比较",
                        "observable的13种创建方式",
                        "observable订阅，时间监听，订阅销毁",
                        "观察者：AnyOberver,Binder",
                        "自定义可绑定属性",
                        "Subjects",
                        "变换操作符",
                        "过滤操作符",
                        "条件操作符",
                        "结合操作符",
                        "算数、以及聚合操作",
                        "连接操作符",
                        "其他操作符",
                        "错误处理操作",
                        "调试操作",
                        "特征序列1",
                        "Driver",
                        "ControlProperty,ControlEvent",
                        "调度器（Schedulers",
                        "UILable",
                        "UITextField、UITextView",
                        "UISwitch 与 UISegmentedControl",
                        "UIActivityIndicatorView 与 UIApplication",
                        "UISlider、UIStepper",
                        "双向绑定：<->",
                        "UIButton 与 UIBarButtonItem",
                        "UIGestureRecognizer",
                        "UIDatePicker",
                        "TableView:基本用法",
                        "RxDataSources",//31
                        "刷新表格",//32
                        "表格数据的搜索过滤",//33
                        "可编辑表格",//34
                        "不同类型的单元格混用",
                        "tableView:样式修改",
                        "collectionV基本用法",
                        "collectionV用RxDataSources",
                        "刷新集合数据",
                        "collectionV样式修改",
                        "UIPickerView的使用",
                        "[unowned self] 与 [weak self]",
                        "URLSession请求数据",
                        "结果处理、模型转换",
                        "RxAlamofire数据请求",
                        "RxAlamofire结果处理、模型转换",
                        "RxAlamofire文件上传",
                        "RxAlamofire文件下载",
                        "Moya数据请求",
                        "Moya结果处理、模型转换",
                        "MVVM架构基本介绍、与MVC比较",
                        "使用Observable样例",
                        "使用Driver样例",
                        "用户注册样例",
                        "显示网络请求活动指示器",
                        "MJRefresh下拉刷新",
                        "上拉加载、以及上下拉组合",
                        "DelegateProxy获取地理定位信息",
                        "DelegateProxy图片选择功能",
                        "DelegateProxy应用生命周期的状态变化",
                        "sendMessage和methodInvoked的区别",
                        "订阅UITableViewCell里的按钮点击事件",
                        "NotificationCenter的使用",
                        "键值观察KVO的使用",
                        "表格图片加载优化",
                        "isEqualOriginValue",
                        "重复执行某个操作序列repeatWhen",
                        "reachedBottom",
                        "RxFeedback安装配置、基本用法",
                        "一个用户注册样例",
                        "GitHub资源搜索样例",
                        "ReactorKit安装配置、基本用法",
                        "ReactorKit一个用户注册样例",
                        "ReactorKitGitHub资源搜索样例"
        
                        
    
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "RxSwift"
        
        tableView.separatorInset = .zero
        tableView.separatorInsetReference = .fromCellEdges
        
        for (idx,name)  in classNameArr.enumerated() {
            listArr.append((idx,name))
        }
        
        
        Observable.just(listArr)
            .bind(to: tableView.rx.items(cellIdentifier:"DSJCell")) { _, item, cell in
                cell.textLabel?.text = "第\(item.0 + 1)课"
                cell.detailTextLabel?.text = item.1
            }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(listItem.self).subscribe(onNext: {listItem in
            
            debugPrint("==\(listItem.0) ==\(listItem.1)")
            
          guard listItem.0 != 1 else
          {
              if let  target = getControllerFromStoryBoard(controllerName: "Class2Ctrl")
              {
                target.title = listItem.1
                self.navigationController?.pushViewController(target, animated: true)
              }
             return
          }
            
          if  let target = getClass(stringName: "Class\(listItem.0 + 1)Ctrl")
          {
            
            target.title = listItem.1
            self.navigationController?.pushViewController(target, animated: true)
          }
            
        }).disposed(by: disposeBag)
        
        
        tableView.rx.itemSelected.subscribe(onNext:{[weak self]  indexPath in
            debugPrint("点击了\(indexPath)")
            self?.tableView.deselectRow(at: indexPath, animated: true)
            
        }).disposed(by: disposeBag)
        
    }

}

