//
//  Music.swift
//  RXSwiftDemo
//
//  Created by 杜胜佳 on 2019/1/19.
//  Copyright © 2019 杜胜佳. All rights reserved.
//

import Foundation


struct Musice {
    let songName:String
    let singer:String
}

extension Musice:CustomStringConvertible
{
    var description: String {
        return "songName:\(String(describing: songName)) ,singer:\(String(describing: singer))"
    }
    
}
