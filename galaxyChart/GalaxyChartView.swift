//
//  GalaxyChartView.swift
//  galaxyChart
//
//  Created by Javi on 20/5/15.
//  Copyright (c) 2015 Javier Loucim. All rights reserved.
//

import UIKit
import Foundation


class GalaxyChartView: UIView {

    func createChart (galaxyData: GalaxyChartResponseModel  ) {

        var maxBubbleSize:Int = 140
        var totalStars = 0
        var maxStarsQuantity = 0
        
        for node in galaxyData.result {
            totalStars += node.starsQuantity
            if maxStarsQuantity < node.starsQuantity {
                maxStarsQuantity =  node.starsQuantity
            }
        }
        
        for node in galaxyData.result {
            var bubbleSize:Double = Double((node.starsQuantity * maxBubbleSize) / maxStarsQuantity)
            var bubble = BubbleView(size: CGFloat(bubbleSize), text: node.name, color: UIColor(rgba: node.color))
            self.addSubview(bubble)
        }
    }
    
    override func layoutSubviews() {
        var startingPoint: CGPoint = CGPoint(x: 0,y: 0)
        var nextPoint: CGPoint
        var minimumHeight: CGFloat = 0
        
        let viewsCount:Int = subviews.count
        for index in 0..<viewsCount {
            var newOrigin:CGPoint = getNextAvailableCoordinate(index)
            var view = subviews[index] as! UIView
            view.frame.origin = newOrigin
        }
            
        super.layoutSubviews()
    }
    
    func getNextAvailableCoordinate (stackOrder: Int) -> CGPoint {
        var coordinate: CGPoint = CGPoint(x: 0, y: 0)

        if (stackOrder > 0) {
            var isOccupied: Bool
            let currentView = subviews[stackOrder] as! UIView
            for yPosition in 0...Int(self.frame.height) {
                isOccupied = true
                for xPosition in 0...Int(self.frame.width) {
                    coordinate = CGPoint(x: CGFloat(xPosition), y: CGFloat(yPosition))
                    isOccupied = isPointOccupied(coordinate, stackOrder: stackOrder-1)
                    if !isOccupied {
                        break
                    }
                }
                var topRightCorner:CGPoint = CGPointMake(coordinate.x + currentView.frame.width,coordinate.y)
                if (!isOccupied) && (topRightCorner.x) < self.frame.width {
                    if !isPointOccupied(topRightCorner, stackOrder: stackOrder-1)  {
                        break
                    }
                }
                
            }
        }
        return coordinate
    }
    
    func isPointOccupied (point: CGPoint, stackOrder: Int) -> Bool {
        var x: Int = 0
        
        var isOccupied: Bool = false
        
        while x <= stackOrder && !isOccupied {
            var viewToAnalyze:UIView = self.subviews[x] as! UIView
            if (viewToAnalyze.frame.origin.x <= point.x && (viewToAnalyze.frame.origin.x + viewToAnalyze.frame.width) >= point.x ) {
                if (viewToAnalyze.frame.origin.y <= point.y && (viewToAnalyze.frame.origin.y + viewToAnalyze.frame.height) >= point.y ) {
                    isOccupied = true
                }
            }
            x++
        }
        return isOccupied
    }
    
}