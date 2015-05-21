//
//  BubbleView.swift
//  galaxyChart
//
//  Created by Javi on 20/5/15.
//  Copyright (c) 2015 Javier Loucim. All rights reserved.
//

import Foundation
//
//  GalaxyChartView.swift
//  galaxyChart
//
//  Created by Javi on 20/5/15.
//  Copyright (c) 2015 Javier Loucim. All rights reserved.
//

import UIKit
import Foundation


class BubbleView: UIView {
    
    
    
    convenience init (size:CGFloat, text: String, color: UIColor) {
        self.init()
        var fontSize:CGFloat = 12.0
        
        var labelHeightAddition:CGFloat = 0
        
        var minLabelHeight:CGFloat = 30
        if (size <= 100) {
            fontSize = 12
        } else if (size > 100 && size < 150) {
            fontSize = 16
            minLabelHeight = 40
        } else {
            fontSize = 18
            minLabelHeight = 40
        }
        
        
        let font = UIFont (name: "Helvetica Neue", size: fontSize)
        
        var labelHeight:CGFloat = size*1/3
        var labelWidth:CGFloat = size/2
        var labelXPosition:CGFloat = size / 2
        var labelYPosition:CGFloat
        var textColor: UIColor
        
        if labelHeight < minLabelHeight {
            labelHeight = minLabelHeight
            labelYPosition = size + (labelHeight / 2)
            textColor = UIColor.darkGrayColor()
            labelWidth =  size
            labelHeightAddition = labelHeight
        } else {
            labelWidth = size/2
            labelYPosition = size*2/3
            textColor = UIColor.whiteColor()
        }
        
        
        self.frame = CGRectMake(0, 0, size,size+labelHeightAddition)
        
        var bubbleLabel:UILabel = UILabel(frame: CGRectMake(0, 0, labelWidth, labelHeight))
        
        bubbleLabel.center = CGPointMake(labelXPosition, labelYPosition)
        bubbleLabel.textAlignment = NSTextAlignment.Center
        bubbleLabel.text = text
        bubbleLabel.textColor = textColor
        bubbleLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        bubbleLabel.font = font
        bubbleLabel.numberOfLines = 0;
        bubbleLabel.sizeThatFits(self.frame.size)
        
        
        var circleView:UIView = UIView()
        circleView.frame = CGRectMake(0, 0, size, size)
        circleView.layer.cornerRadius = self.frame.width/2
        circleView.backgroundColor = color

        self.addSubview(circleView)
        self.addSubview(bubbleLabel)
    }
    
    
    
}