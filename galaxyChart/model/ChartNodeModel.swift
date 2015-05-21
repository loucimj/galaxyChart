//
//  ChartNodeModel.swift
//  galaxyChart
//
//  Created by Javi on 21/5/15.
//  Copyright (c) 2015 Javier Loucim. All rights reserved.
//

import Foundation

class ChartNodeModel {
    var nodeID: Int = 0
    var name: String = ""
    var starsQuantity: Int = 0
    var color: String = ""
    var imageID: String = ""
    var percentage: Float = 0.0

    init (nodeID: Int, name:String, starsQuantity: Int,color:String,imageID: String,percentage: Float) {
        self.nodeID = nodeID
        self.name = name
        self.starsQuantity = starsQuantity
        self.color = color
        self.imageID = imageID
        self.percentage = percentage
    }
}