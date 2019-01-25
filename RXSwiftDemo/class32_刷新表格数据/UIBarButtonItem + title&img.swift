//
//  UIBarButtonItem + title&img.swift
//  JoyShopsManager
//
//  Created by dsj on 2017/4/8.
//  Copyright © 2017年 joyshops. All rights reserved.
//

import Foundation
import UIKit

public enum BarButtonItemTitleAli {
    case left
    case right
    case top
}
extension UIBarButtonItem
{
  public  class func barButtonItem(title:String?,titlAli:BarButtonItemTitleAli?,imgName:String?,selector:Selector?,target:Any) -> UIBarButtonItem
    {
        let customView = UIView.init() 
        var titleLb:UILabel?
        var imgV:UIImageView?
        //计算标题长度
        if title != nil
        {
            let dic = [kCTFontAttributeName:UIFont.systemFont(ofSize: 13)]
            let str = NSString.init(string: title!)
            let titleLenght = str.boundingRect(with: CGSize.init(width: UIScreen.main.bounds.width - 100, height: 44), options: .usesLineFragmentOrigin, attributes: dic as [NSAttributedStringKey : Any], context: nil).size.width
            titleLb = UILabel.init(frame: CGRect.init(x: 8, y: 8, width: titleLenght, height: 20))
            titleLb?.text = title//先设值
            titleLb?.font = UIFont.systemFont(ofSize: 13)//字体要在后面设置
            titleLb?.textColor = UIColor.blue
            titleLb?.textAlignment = .center
        }
        //有图标设置图标
        if imgName != nil
        {
            imgV = UIImageView.init(image: UIImage.init(named: imgName!))
            imgV?.frame.size = CGSize.init(width: 22, height: 22)
            
        }
        
        //添加子视图 1 有标题有图标 2 有标题没图标 3有图标没标题
        if titleLb != nil && imgV != nil
        {
            //四种情况： 1 标题在左边 2 标题在右边 3 标题在上（反人类） 4 标题在下（默认）
            //customViewde frame
            customView.frame = CGRect.init(x: 0, y: 8, width: (titleLb?.frame.width)! + 16 + (imgV?.frame.width)!, height: 44)
            
            if titlAli == .left {
                
                imgV?.frame.origin = CGPoint.init(x: (titleLb?.frame.maxX)! , y: 8)
                titleLb?.center = CGPoint.init(x: (titleLb?.center.x)!, y: customView.center.y)
                imgV?.center = CGPoint.init(x: (imgV?.center.x)!, y: customView.center.y)
                
                
            }
            else if titlAli == .right
            {
                
                imgV?.frame.origin = CGPoint.init(x:  8 , y: 8)
                titleLb?.frame.origin = CGPoint.init(x: (imgV?.frame.maxX)! + 4, y: 8)
                titleLb?.center = CGPoint.init(x: (titleLb?.center.x)!, y: customView.center.y)
                imgV?.center = CGPoint.init(x: (imgV?.center.x)!, y: customView.center.y)
                
            }
            else if titlAli == .top
            {
                let with = (titleLb?.frame.width)! - (imgV?.frame.width)! > 0 ? titleLb?.frame.width : imgV?.frame.width
                customView.frame = CGRect.init(x: 0, y: 0, width:with!  , height: 44)
                imgV?.center = CGPoint.init(x: customView.center.x, y: (titleLb?.frame.maxY)! + 8 + (imgV?.frame.height)!/2)
            }
            else
            {
                let with = (titleLb?.frame.width)! - (imgV?.frame.width)! > 0 ? titleLb?.frame.width : imgV?.frame.width
                customView.frame = CGRect.init(x: 0, y: 0, width:with!  , height: 44)
                imgV?.center = CGPoint.init(x: customView.center.x, y: (imgV?.frame.size.height)!/2 + 4)
                titleLb?.center = CGPoint.init(x: (imgV?.center.x)!, y: (imgV?.frame.maxY)!  + (titleLb?.frame.height)!/2 - 4)
                titleLb?.font = UIFont.systemFont(ofSize: 10)//字体
                
            }
            
            customView.addSubview(titleLb!)
            customView.addSubview(imgV!)
            
        }
        else if titleLb != nil && imgV == nil
        {
            customView.frame = CGRect.init(x: 0, y: 0, width: 8 + (titleLb?.frame.width)!, height: 44)
            titleLb?.textAlignment = .center
            titleLb?.center = customView.center
            customView.addSubview(titleLb!)
            
        }
        else if titleLb == nil && imgV != nil
        {
            customView.frame = CGRect.init(x: 0, y: 0, width: 8 + (imgV?.frame.width)! , height: 44)
            imgV?.center = customView.center
            customView.addSubview(imgV!)
        }
        
        //添加点击手势，响应点击事件
        let tap = UITapGestureRecognizer.init(target: target, action: selector)
        customView.addGestureRecognizer(tap)
        
        return UIBarButtonItem.init(customView: customView)
    }
}
