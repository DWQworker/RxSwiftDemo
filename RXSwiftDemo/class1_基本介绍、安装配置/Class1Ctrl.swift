//
//  Class1Ctrl.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/19.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Class1Ctrl: ClassBaseCtrl {
    
  override var  webUrl:String?
    {
        return WebUrl.Class1Ctrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        descriptionV.text =
        """
        一、Rx 介绍
        1，什么是 Rx?
        Rx 是 ReactiveX 的缩写，简单来说就是基于异步 Event（事件）序列的响应式编程。
        Rx 可以简化异步编程方法，并提供更优雅的数据绑定。让我们可以时刻响应新的数据同时顺序地处理它们。

        2，Rx 库
        Rx 本身可以说是一种跨平台的标准，它有自己的社区论坛，不管是 web 还是移动开发，都能用 Rx 的思维和方法来完成你的工作。
        作为一种跨平台标准，目前已经有许多基于不同开发语言的 Rx 的库。除了我后面会着重介绍的 RxSwift 之外，还有 RxJava, RxJS, RxKotlin, Rx.NET...等等。
        这些 Rx 库虽然用的语言不同，但它们之间其实都是相通的，都有相同的 API。所以说如果以后你使用别的语言做其他的方面的开发，同样是可以使用相同的思维甚至相同的方法接口（除了语言不同）来编程。

        3，Rx 主页
        如果想了解整个 Rx 大家庭的成员，可以访问它的主页：http://reactivex.io
        在这里我们可以看到所有支持的语言，以及平台：
        原文:Swift - RxSwift的使用详解1（基本介绍、安装配置）

        二、RxSwift 介绍
        1，RxSwift 的作用
        （1）在编写代码时我们经常会需要检测某些值的变化（比如：textFiled 输入值的变化、数据请求完成或失败的变化），然后进行相应的处理。
        过去针对不同的情况，我们需要采用不同的事件传递方法去处理，比如：delegate、notification、target-action、KVO 等等。
        而 RectiveX 机制（由 RxSwift 实现）的出现，让程序里的事件传递响应方法做到统一。将之前那些常用的事件传递方法（比如：delegate、notification、target-action 等等），全部替换成 Rx 的“信号链”方式。

        （2）如果我们平时使用的是 MVVM 开发模式的话，通过 RxSwift 可以获得更加方便的数据绑定的方法，使得 MVVM 开发更加如虎添翼。

        2、RxSwift 的安装与配置
        （1）从 GitHub 上下载最新的代码：https://github.com/ReactiveX/RxSwift
        （2）将下载下来的源码包中 Rx.xcodeproj 拖拽至你的工程中
        原文:Swift - RxSwift的使用详解1（基本介绍、安装配置）

        （3）工程 -> General -> Embedded Binaries 项，把 iOS 版的 RxSwift.framework、RxCocoa.framework 添加进来
        原文:Swift - RxSwift的使用详解1（基本介绍、安装配置）

        （4）最后，在需要使用 RxSwift 的地方 import 进来就可以了
        1
        2
        import RxSwift
        import RxCocoa

        3，RxSwift 与 RxCocoa
        前面配置的时候，我们会在 Swift 项目中引入 RxSwift、RxCocoa 这两个库，他们的作用分别是：
        RxSwift：它只是基于 Swift 语言的 Rx 标准实现接口库，所以 RxSwift 里不包含任何 Cocoa 或者 UI 方面的类。
        RxCocoa：是基于 RxSwift 针对于 iOS 开发的一个库，它通过 Extension 的方法给原生的比如 UI 控件添加了 Rx 的特性，使得我们更容易订阅和响应这些控件的事件。
        """
    }
}
