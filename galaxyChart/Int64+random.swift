//
//  Int64+random.swift
//  galaxyChart
//
//  Created by Javi on 4/6/15.
//  Copyright (c) 2015 Javier Loucim. All rights reserved.
//

import Foundation

extension UInt64 {
    
    static func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
}
