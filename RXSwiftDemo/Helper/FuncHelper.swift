//
//  FuncHelper.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/19.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import Foundation
import UIKit

//MARK:字符串转控制器类,代码创建
func getClass(stringName: String) -> UIViewController?{
    
    // 1.获取命名空间
    // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
    guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
        print("命名空间不存在")
        return nil
    }
    // 2.通过命名空间和类名转换成类
    let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + stringName)
    
    // swift 中通过Class创建一个对象,必须告诉系统Class的类型
    guard let clsType = cls as? UIViewController.Type else {
        print("无法转换成UIViewController")
        return nil
    }
    // 3.通过Class创建对象
    let controllerInstance = clsType.init()

    return controllerInstance
}

//MARK:storyId 创建控制器
func getControllerFromStoryBoard(controllerName:String ,storyBoardName:String? = "Main") -> UIViewController?
{
    guard storyBoardName != nil  else {
        
        let main =  UIStoryboard.init(name: "Main", bundle: nil)
        
        return  main.instantiateViewController(withIdentifier:controllerName)
    }
    
    let storyBoard = UIStoryboard.init(name: storyBoardName!, bundle: nil)
    
    return storyBoard.instantiateViewController(withIdentifier:controllerName)

}
