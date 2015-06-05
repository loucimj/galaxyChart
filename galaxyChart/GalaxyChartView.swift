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

    
    var yFrameIncrement = 50
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
            var bubble = BubbleView(size: CGFloat(bubbleSize), text: node.name, color: UIColor(rgba: node.color), animated: true)
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
    
    private func getNextAvailableCoordinate (stackOrder: Int) -> CGPoint {
        var coordinate: CGPoint = CGPoint(x: 0, y: 0)

        var yFrom = 0
        
        if (stackOrder > 0) {
            var isCoordinateOccupied: Bool
            let currentView = subviews[stackOrder] as! UIView
            
            var randomTry = 0
            isCoordinateOccupied = true
            var xProposition: Int = 0
            var yProposition: Int = 0 
            
            while (isCoordinateOccupied) {
                while randomTry < 5 && isCoordinateOccupied {
                    xProposition = UInt64.randomInt(0, max: Int(self.frame.size.width))
                    yProposition = UInt64.randomInt(yFrom, max: yFrom+yFrameIncrement)
                    
                    if !isAreaOccupied(CGRectMake(CGFloat(xProposition), CGFloat(yProposition), currentView.frame.width, currentView.frame.height), stackOrder: stackOrder) {
                        var widthPlusXPosition = xProposition+Int(currentView.frame.size.width)
                        if  widthPlusXPosition < Int(self.frame.size.width) {
                            isCoordinateOccupied = false
                        }
                    } else {
                        randomTry++
                    }
                }
                yFrom += yFrameIncrement
                randomTry = 0
                coordinate.x = CGFloat(xProposition)
                coordinate.y = CGFloat(yProposition)
            }
        
            
            
        }
        return coordinate
    }
    

    private func getNextAvailableCoordinateOld (stackOrder: Int) -> CGPoint {
        var coordinate: CGPoint = CGPoint(x: 0, y: 0)
                                                                                      
        if (stackOrder > 0) {
            var isCoordinateOccupied: Bool
            let currentView = subviews[stackOrder] as! UIView
            for yPosition in 0...Int(self.frame.height) {
                isCoordinateOccupied = true
                for xPosition in 0...Int(self.frame.width) {
                    coordinate = CGPoint(x: CGFloat(xPosition), y: CGFloat(yPosition))
                    isCoordinateOccupied = isPointOccupied(coordinate, stackOrder: stackOrder-1)
                    if !isCoordinateOccupied {
                        break
                    }
                }
                var topRightCorner:CGPoint = CGPointMake(coordinate.x + currentView.frame.width,coordinate.y)
                if (!isCoordinateOccupied) && (topRightCorner.x) < self.frame.width {
                    if !isPointOccupied(topRightCorner, stackOrder: stackOrder-1)  {
                        var destinationArea = CGRectMake(coordinate.x, coordinate.y, currentView.frame.size.width, currentView.frame.size.height)
                        if !isAreaOccupied(destinationArea,stackOrder: stackOrder-1) {
                            break
                        }
                    }
                }
                
            }
        }
        return coordinate
    }
    
    private func isPointOccupied (point: CGPoint, stackOrder: Int) -> Bool {
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
    
    private func isAreaOccupied (area:CGRect, stackOrder: Int) -> Bool {
        var isOccupied: Bool = false
        var x: Int = 0
        while x <= stackOrder && !isOccupied {
            var viewToAnalyze:UIView = self.subviews[x] as! UIView
            var currentRect: CGRect = viewToAnalyze.frame
            if (CGRectIntersectsRect(currentRect, area)) {
                isOccupied = true
                break
            }
            x++
        }
        
        return isOccupied
    }
}