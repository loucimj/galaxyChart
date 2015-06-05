//
//  PeopleGalaxyView.swift
//  galaxyChart
//
//  Created by Javier Loucim on 4/6/15.
//  Copyright (c) 2015 Javier Loucim. All rights reserved.
//

import UIKit
import Foundation

class PeopleGalaxyView: GalaxyChartView {
    
    
    override func createChart(galaxyData: GalaxyChartResponseModel) {
        for node in galaxyData.result {
            var bubbleSize = CGFloat(UInt64.randomInt(50, max: 140))
            var bubble = PeopleBubble(imageURLString: node.imageURL, text: node.name, color: UIColor.grayColor(), animated: true)
            self.addSubview(bubble)
        }
        
    }
    
}
