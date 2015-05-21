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

    func createChart (galaxyData: NSDictionary  ) {
        
        var bubble1 :UIView
        var bubble2 :UIView
        var bubble3 :UIView
        var bubble4 :UIView
        var bubble5 :UIView
        var bubble6 :UIView
        var bubble7 :UIView
        
        bubble1 = BubbleView(size: 140, text: "Burbuja 1", color: UIColor.blueColor())
        bubble2 = BubbleView(size: 80, text: "Burbuja 2", color: UIColor.purpleColor())
        bubble3 = BubbleView(size: 40, text: "Burbuja 3", color: UIColor.lightGrayColor())
        bubble4 = BubbleView(size: 100, text: "Burbuja 4", color: UIColor.lightGrayColor())
        bubble5 = BubbleView(size: 60, text: "Burbuja 5", color: UIColor.greenColor())
        bubble6 = BubbleView(size: 30, text: "Burbuja 6", color: UIColor.magentaColor())
        bubble7 = BubbleView(size: 90, text: "Burbuja 7", color: UIColor.redColor())
        
        self.addSubview(bubble6)
        self.addSubview(bubble7)
        self.addSubview(bubble3)
        self.addSubview(bubble1)
        self.addSubview(bubble2)
        self.addSubview(bubble4)
        self.addSubview(bubble5)
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