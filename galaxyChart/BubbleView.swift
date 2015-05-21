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
        var labelWidthAddition:CGFloat = 0
        let minimumLabelWidth:CGFloat = 60
        
        var minLabelHeight:CGFloat = 30
        if (size <= 100) {
//            fontSize = 12
        } else if (size > 100 && size < 150) {
//            fontSize = 16
            minLabelHeight = 40
        } else {
//            fontSize = 18
            minLabelHeight = 40
        }
        
        
        let font = UIFont (name: "Helvetica Neue", size: fontSize)
        
        var labelHeight:CGFloat = size*1/3
        var labelWidth:CGFloat = size/2
        var labelXPosition:CGFloat = size / 2
        var labelYPosition:CGFloat
        var textColor: UIColor
        var imageYCenterPosition: CGFloat = size * 0.32
        var imageSize:CGFloat = size * 0.25
        
        if labelHeight < minLabelHeight {
            labelHeight = minLabelHeight
            labelYPosition = size + (labelHeight / 2)
            textColor = UIColor.darkGrayColor()
            labelHeightAddition = labelHeight
            if size < minimumLabelWidth {
                labelWidth = minimumLabelWidth
                labelWidthAddition = minimumLabelWidth - size
                labelXPosition = labelWidth/2
                imageYCenterPosition = size / 2
                imageSize = size * 0.40
            } else {
                labelWidth =  size
            }

        } else {
            labelWidth = size/2
            labelYPosition = size*2/3
            textColor = UIColor.whiteColor()
        }
        
        
        self.frame = CGRectMake(0, 0, size+labelWidthAddition,size+labelHeightAddition)
        
        var bubbleLabel:UILabel = UILabel(frame: CGRectMake(0, 0, labelWidth, labelHeight))
        
        bubbleLabel.center = CGPointMake(labelXPosition, labelYPosition)
        bubbleLabel.textAlignment = NSTextAlignment.Center
        bubbleLabel.text = text
        bubbleLabel.textColor = textColor
        bubbleLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        bubbleLabel.font = font
        bubbleLabel.numberOfLines = 0;
        bubbleLabel.minimumScaleFactor = 0.5
        bubbleLabel.adjustsFontSizeToFitWidth = true
//        bubbleLabel.sizeThatFits(self.frame.size)
        
        
        var circleView:UIView = UIView()
        let padding:CGFloat = 4
        circleView.frame = CGRectMake(0+padding, 0+padding, size-padding, size-padding)
        circleView.center = CGPointMake(labelXPosition, circleView.center.y)
        circleView.layer.cornerRadius = (size-padding)/2
        circleView.backgroundColor = color
        
        var image: UIImage = UIImage(named: "BubbleViewImage")!
        
        var imageView: UIImageView = UIImageView(image: image)
        
        
        imageView.frame = CGRectMake(0, 0, imageSize,imageSize)
        imageView.center = CGPointMake( circleView.center.x, imageYCenterPosition)

        self.addSubview(circleView)
        self.addSubview(imageView)
        self.addSubview(bubbleLabel)
    }
    
    
    
}