//
//  Class18Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Class18Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class18Ctrl
    }
    lazy var lb:UILabel = {
       let lable = UILabel.init(frame: CGRect.init(x: 20, y: 80, width: 200, height: 100))
        self.view.addSubview(lable)
        return lable
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Driver 
        

        
    }
}


