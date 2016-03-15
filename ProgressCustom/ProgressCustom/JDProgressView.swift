//
//  JDProgressView.swift
//  ProgressCustom
//
//  Created by Jack Dao on 3/14/16.
//  Copyright © 2016 Rubify. All rights reserved.
//

import UIKit

class JDProgressView: UIView {

    var emptyProgressImagePath = "bottle_empty.png"
    var fullProgressImagePath: String? = nil
    var fullColorProgress: UIColor? = nil
    
    var maskImageView = UIImageView()
    let shapeMaskValue = CAShapeLayer()
    
    var isVerticalProgress = false // doc
    private var progress:CGFloat = 0
    
    // percent ignore value on image
    /*
           ||||
        ||||  ||||  -> % ignore top
        || 100% ||
        ||  :   ||
        ||  :   ||
        ||  :   ||
        ||  2%  ||
        ||  1%  ||
        ||||||||||  -> % ignore bottom
        ||||||||||
    
    */
    var ignoreTop:CGFloat = 0
    var ignoreBottom:CGFloat = 0
    
    var layerEmpty = CALayer()
    var layerFull: CALayer?
    var layerFullTemp: CAShapeLayer?
//    class func createJDProgressView() -> JDProgressView {
//        let progressView = JDProgressView()
//        return progressView
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configView()
    }
    
    func configView() {
        self.backgroundColor = UIColor.whiteColor()
    }
    
    func getProgress() -> CGFloat {
        return self.progress
    }
    
    func setProgress(value: CGFloat) {
        if value > 1{
            self.progress = 1
        } else if value < 0 {
            self.progress = 0
        } else {
            self.progress = value
        }
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        
        layerEmpty.contents = UIImage(named: emptyProgressImagePath)?.CGImage
        layerEmpty.frame = self.bounds
        
        let path = UIBezierPath()
        if !isVerticalProgress {
            let ignoreYTop = ignoreTop * self.bounds.height
            let ignoreYBottom = ignoreBottom * self.bounds.height
            let heightOfValue = progress * (self.bounds.height - ignoreYTop - ignoreYBottom)
            let yLimit = self.bounds.height - ignoreYBottom - heightOfValue
            path.moveToPoint(CGPointMake(0, yLimit))
            path.addLineToPoint(CGPointMake(self.bounds.width, yLimit))
            path.addLineToPoint(CGPointMake(self.bounds.width, yLimit + heightOfValue))
            path.addLineToPoint(CGPointMake(0, yLimit + heightOfValue))
            path.closePath()
        } else {
            let ignoreYTop = ignoreTop * self.bounds.width
            let ignoreYBottom = ignoreBottom * self.bounds.width
            let widthOfValue = progress * (self.bounds.width - ignoreYTop - ignoreYBottom)
            let xLimit = widthOfValue
            path.moveToPoint(CGPointMake(0, 0))
            path.addLineToPoint(CGPointMake(xLimit, 0))
            path.addLineToPoint(CGPointMake(xLimit, self.bounds.height))
            path.addLineToPoint(CGPointMake(0, self.bounds.height))
            path.closePath()
        }
        let oldPath = shapeMaskValue.path
        
        if fullProgressImagePath != nil && fullColorProgress == nil {
            if fullProgressImagePath != nil {
                if layerFull == nil {
                    layerFull = CALayer()
                }
                layerFull?.contents = UIImage(named: fullProgressImagePath!)?.CGImage
                layerFull?.frame = self.bounds
            }
            
            shapeMaskValue.frame = self.bounds
            shapeMaskValue.path = path.CGPath
            
            let animationLine = CABasicAnimation(keyPath: "path")
            animationLine.fromValue = oldPath
            animationLine.toValue = path.CGPath
            animationLine.duration = 0.33
            animationLine.additive = true
            
            shapeMaskValue.addAnimation(animationLine, forKey: "animationPath")
            
            layerFull?.mask = shapeMaskValue
            self.layer.addSublayer(layerEmpty)
            self.layer.addSublayer(layerFull!)
        } else if self.fullColorProgress != nil && self.fullProgressImagePath == nil {
            shapeMaskValue.frame = self.bounds
            shapeMaskValue.path = path.CGPath
            shapeMaskValue.fillColor = fullColorProgress?.CGColor
            
            if layerFull == nil {
                layerFull = CALayer()
                layerFull?.frame = self.bounds
                layerFull?.backgroundColor = fullColorProgress?.CGColor
                
                maskImageView = UIImageView(image: self.imageWithImage(UIImage(named: emptyProgressImagePath)!, scaledToSize: self.bounds.size))
            }
            
            let animationLine = CABasicAnimation(keyPath: "path")
            animationLine.fromValue = oldPath
            animationLine.toValue = path.CGPath
            animationLine.duration = 0.33
            animationLine.additive = true
            
            shapeMaskValue.addAnimation(animationLine, forKey: "animationPath")
            
            self.layer.addSublayer(layerEmpty)
            self.layer.addSublayer(shapeMaskValue)
            self.maskView = maskImageView
        } else {
            shapeMaskValue.frame = self.bounds
            shapeMaskValue.path = path.CGPath
            shapeMaskValue.fillColor = fullColorProgress?.CGColor
            
            if layerFull == nil {
                layerFull = CALayer()
                layerFull?.frame = self.bounds
                layerFull?.backgroundColor = fullColorProgress?.CGColor
                
                maskImageView = UIImageView(image: self.imageWithImage(UIImage(named: fullProgressImagePath!)!, scaledToSize: self.bounds.size))
            }
            
            let animationLine = CABasicAnimation(keyPath: "path")
            animationLine.fromValue = oldPath
            animationLine.toValue = path.CGPath
            animationLine.duration = 0.33
            animationLine.additive = true
            
            shapeMaskValue.addAnimation(animationLine, forKey: "animationPath")
            shapeMaskValue.mask = maskImageView.layer
            self.layer.addSublayer(layerEmpty)
            self.layer.addSublayer(shapeMaskValue)
//            self.maskView = maskImageView
        }
    }
    
    func imageWithImage(image: UIImage, scaledToSize newSize:CGSize) -> UIImage {
        UIGraphicsBeginImageContext( newSize );
        image .drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return newImage;
    }
}
