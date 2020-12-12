//
//  food.swift
//
//  Created by Nicholas Mel
//  Copyright © 2018 Nicholas Mel. All rights reserved.
//

import Foundation

class food
{
    var food:[item] = []
    
    init()
    {
        let f1 = item(fn: "Hamburger", fd: "Review: I love this burger! The best one in town!"
        
        food.append(f1)
    }
    
}

class item
{
    var foodName:String?
    var foodDescription:String?
    var foodImageName:String?
    
    init(fn:String, fd:String, fin:String)
    {
        foodName = fn
        foodDescription = fd
        foodImageName = fin
        
    }
    
    
}
