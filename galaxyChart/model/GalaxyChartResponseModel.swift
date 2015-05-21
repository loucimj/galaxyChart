//
//  GalaxyChartResponseModel.swift
//  galaxyChart
//
//  Created by Javi on 21/5/15.
//  Copyright (c) 2015 Javier Loucim. All rights reserved.
//

import Foundation

class GalaxyChartResponseModel{
    var message: String
    var result: [ChartNodeModel]
    
    init (message:String , result: [ChartNodeModel]) {
        self.message = message
        self.result = result
    }
}
