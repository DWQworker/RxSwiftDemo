//
//  Class29Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/22.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class Class29Ctrl: ClassBaseCtrl {
    override var  webUrl:String?
    {
        return WebUrl.Class29Ctrl
    }
    
    lazy var datePicker :UIDatePicker = {
        let dp  = UIDatePicker.init(frame: CGRect.init(x: 20, y: 100, width: 300, height: 100))
        self.view.addSubview(dp)
        return dp
    }()
    
    
    lazy var lb:UILabel = {
        let lable = UILabel.init(frame: CGRect.init(x: 20, y: 250, width: 300, height: 44))
        self.view.addSubview(lable)
        return lable
    }()
    
    
    lazy var bt :UIButton = {
        let btn = UIButton.init(frame: CGRect.init(x: 20, y: 300, width: 200, height: 44))
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.setTitleColor(UIColor.gray, for: .disabled)
        self.view.addSubview(btn)
        return btn
    }()
    
    
    var dateformate: DateFormatter = {
         let dateformater =   DateFormatter.init()
              dateformater.dateFormat = "yyyy年MM月dd日 HH:mm"
        
        return dateformater
        
    }()
    
    var stop =  BehaviorRelay.init(value: true)
    var timer = BehaviorRelay<Double>.init(value: 60)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        datePicker.rx.date
//        .map{ [weak self] in
//
//        return self?.dateformate.string(from: $0)
//
//        }
//        .bind(to: lb.rx.text)
//        .disposed(by: disposeBag)
        
        datePicker.datePickerMode = .countDownTimer
        //MARK:倒计时
        DispatchQueue.main.async {
             self.datePicker.rx.countDownDuration <-> self.timer
        }
        
        stop.asObservable().bind(to: datePicker.rx.isEnabled).disposed(by: disposeBag)
        stop.asObservable().bind(to: bt.rx.isEnabled).disposed(by: disposeBag)
        
        Observable.combineLatest(timer.asObservable(),stop.asObservable() ) { (ti ,st)  in
            if st
            {
                return "开始"
            }
            else
            {
                return "剩余\(ti)秒"
            }
        }.bind(to: bt.rx.title())
        .disposed(by: disposeBag)
        
        bt.rx.tap
        .subscribe{ [weak self] in
             debugPrint($0)
              self?.start()
               
        }
        .disposed(by: disposeBag)
        

    }
    
    func start()
    {
        
        stop.accept(false)
        
        
        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .takeUntil(stop.filter{$0})
            .subscribe
            {  [weak self] event in//event 即使没有用上也要出现，不然 这个闭包不调用
                
                let value = (self?.timer.value)! - 1
                
                self?.timer.accept(value)
                
                if self?.timer.value == 0
                {
                    debugPrint("倒计时结束 重来哦")
                    
                    self?.timer.accept(60)
                    self?.stop.accept(true)
                }
                
            } .disposed(by: disposeBag)
        
        
        
    }
    
    //开始倒计时
    func startClicked() {
        //开始倒计时
        self.stop.accept(false)
        
        //创建一个计时器
        Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .takeUntil(stop.filter{ $0 }) //倒计时结束时停止计时器
            .subscribe { event in
                //每次剩余时间减1
                self.timer.accept(self.timer.value - 1)
                // 如果剩余时间小于等于0
                if(self.timer.value == 0) {
                    print("倒计时结束！")
                    //结束倒计时
                    self.stop.accept(true)
                    //重制时间
                    self.timer.accept(60)
                }
            }.disposed(by: disposeBag)
    }
}
