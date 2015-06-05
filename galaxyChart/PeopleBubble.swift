
//
//  GalaxyChartView.swift
//  galaxyChart
//
//  Created by Javi on 20/5/15.
//  Copyright (c) 2015 Javier Loucim. All rights reserved.
//

import UIKit
import Foundation

class PeopleBubble: UIView {
    
    convenience init (imageURLString: String, text: String, color: UIColor) {
        self.init()
        createView(imageURLString, text: text, color: color, animated: false)
    }
    
    convenience init (imageURLString: String, text: String, color: UIColor, animated: Bool) {
        self.init()
        createView(imageURLString, text: text, color: color, animated: animated)
    }
    
    private func createView (imageURLString: String, text: String, color: UIColor, animated: Bool) {
        var fontSize:CGFloat = 12.0
        
        var size = CGFloat(UInt64.randomInt(80, max: 120))
        
        self.frame = CGRectMake(0, 0, size,size)

        let font = UIFont (name: "Helvetica Neue", size: fontSize)

        var circleView:UIView = UIView()
        let padding:CGFloat = 50
        circleView.frame = CGRectMake(0+padding, 0+padding, size-padding, size-padding)
        circleView.center = CGPointMake(size/2, size*0.4)
        circleView.layer.cornerRadius = (size-padding)/2
        circleView.backgroundColor = UIColor.grayColor()

        var imageSize = (size-padding)
        var imageView: UIImageView = UIImageView()
        imageView.frame = CGRectMake(0, 0, size-padding-2,size-padding-2)
        imageView.center = CGPointMake(imageSize/2,imageSize/2)
        imageView.layer.cornerRadius = imageSize/2
        imageView.layer.masksToBounds = true
        
        imageView.sd_setImageWithURL(NSURL(string: imageURLString))

        var bubbleLabel:UILabel = UILabel(frame: CGRectMake(0, 0, size, 40))
        
        bubbleLabel.center = CGPointMake(size/2, circleView.frame.height + circleView.frame.origin.y + 15)
        bubbleLabel.textAlignment = NSTextAlignment.Center
        bubbleLabel.text = text
        bubbleLabel.textColor = UIColor.grayColor()
        bubbleLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        bubbleLabel.font = font
        bubbleLabel.numberOfLines = 0;
        bubbleLabel.minimumScaleFactor = 0.5
        bubbleLabel.adjustsFontSizeToFitWidth = true
        
        circleView.addSubview(imageView)
        
        self.frame = CGRectMake(0, 0, size,size)
        
        self.addSubview(circleView)
        self.addSubview(bubbleLabel)
        
        if (animated) {
            self.transform = CGAffineTransformMakeScale(0.3, 0.3)
            self.alpha = 0
            var delay:Float = Float(arc4random_uniform(100) )/100
            UIView.animateWithDuration(1.3,
                delay: NSTimeInterval(delay),
                usingSpringWithDamping: 0.2,
                initialSpringVelocity: 8.0,
                options: UIViewAnimationOptions.AllowUserInteraction,
                animations: {
                    self.transform = CGAffineTransformIdentity
                    self.alpha = 1
                }, completion: nil)
            
        }
    }
    

    
}