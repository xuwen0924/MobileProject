//
//  UIView-ShortCuts.swift
//  Swift-Useful-Extensions
//
//  Created by Yin Xu on 6/9/14.
//  Copyright (c) 2014 YinXuApp. All rights reserved.
//
import CoreFoundation
import Foundation
import UIKit

extension Int{
    var isEven:Bool     {return (self % 2 == 0)}
    var isOdd:Bool      {return (self % 2 != 0)}
    var isPositive:Bool {return (self >= 0)}
    var isNegative:Bool {return (self < 0)}
    var toDouble:Double {return Double(self)}
    var toFloat:Float   {return Float(self)}
    
    var digits:Int {//this only works in bound of LONG_MAX 2147483647, the maximum value of int
        if(self == 0)
        {
            return 1
        }
        else if(Int(fabs(Double(self))) <= LONG_MAX)
        {
            return Int(log10(fabs(Double(self)))) + 1
        }
        else
        {
            return -1; //out of bound
        }
    }
}

extension Double{
    func roundToDecimalDigits(decimals:Int) -> Double
    {
        let a : Double = self
        let format : NumberFormatter = NumberFormatter()
        format.numberStyle = NumberFormatter.Style.decimal
        format.roundingMode = NumberFormatter.RoundingMode.halfUp
        format.maximumFractionDigits = 2
        let string: NSString = format.string(from: NSNumber(value: a as Double))! as NSString
        print(string.doubleValue)
        return string.doubleValue
    }
}

extension String{
    var length:Int {return String(self).characters.count}

    func containsString(s:String) -> Bool
    {
        if(range(of: s) != nil)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func containsString(s:String, compareOption: NSString.CompareOptions) -> Bool
    {
        if((range(of: s, options: compareOption)) != nil)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func reverse() -> String
    {
        var reverseString : String = ""
        for c in characters
        {
            reverseString = String(c) + reverseString
        }
        return reverseString
    }
}

//UIView
extension UIView{
    var vWidth:      CGFloat { return frame.size.width }
    var vHeight:     CGFloat { return frame.size.height }
    var vSize:       CGSize  { return frame.size}
    
    var vOrigin:     CGPoint { return frame.origin }
    var vX:          CGFloat { return frame.origin.x }
    var vY:          CGFloat { return frame.origin.y }
    var centerX:    CGFloat { return center.x }
    var centerY:    CGFloat { return center.y }
    
    var left:       CGFloat { return frame.origin.x }
    var right:      CGFloat { return frame.origin.x + frame.size.width }
    var top:        CGFloat { return frame.origin.y }
    var bottom:     CGFloat { return frame.origin.y + frame.size.height }
    
    func getScaleHeight(width1:CGFloat,height1:CGFloat,width2:CGFloat,height2:CGFloat) -> CGFloat {
        let height1 = (width2 * height1) / width1
        return height1
    }
    
    func setWidth(width:CGFloat)
    {
        frame.size.width = width
    }
    
    func setHeight(height:CGFloat)
    {
        frame.size.height = height
    }
    
    func setSize(size:CGSize)
    {
        frame.size = size
    }
    
    func setOrigin(point:CGPoint)
    {
        frame.origin = point
    }
    
    func setX(x:CGFloat) //only change the origin x
    {
        frame.origin = CGPoint(x: x, y: frame.origin.y)
    }
    
    func setY(y:CGFloat) //only change the origin x
    {
        frame.origin = CGPoint(x: frame.origin.x, y: y)
    }
    
    func setCenterX(x:CGFloat) //only change the origin x
    {
        center = CGPoint(x: x, y: center.y)
    }
    
    func setCenterY(y:CGFloat) //only change the origin x
    {
        center = CGPoint(x: center.x, y: y)
    }
    
    func roundCorner(radius:CGFloat)
    {
        layer.cornerRadius = radius
    }
    
    func setTop(top:CGFloat)
    {
        frame.origin.y = top
    }
    
    func setLeft(left:CGFloat)
    {
        frame.origin.x = left
    }
    
    func setRight(right:CGFloat)
    {
        frame.origin.x = right - frame.size.width
    }
    
    func setBottom(bottom:CGFloat)
    {
        frame.origin.y = bottom - frame.size.height
    }
    
    //MARK: --设置圆角
    func setLayerCornerRadius(radius: CGFloat?) -> Void {
        layer.cornerRadius = radius!
        layer.masksToBounds = true
        layer.shadowRadius = 0
        layer.shadowOpacity = 0
        layer.shadowOffset = CGSize(width:0,height:0)
    }
    
    //MARK: --设置边框
    func setLayerBorderAnColor(borderWidth:CGFloat,color:UIColor) -> Void {
        layer.borderWidth = borderWidth;
        layer.borderColor = color.cgColor;
    }
    
    //MARK: --设置view指定一个地方圆角
    func setViewByRoundingCorners(corners:UIRectCorner,cornerRadii:CGSize) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)//[UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:corners cornerRadii:cornerRadii];
        
        let maskLayer = CAShapeLayer();
        
        //    maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.cgPath;
        
        layer.mask = maskLayer;
    }
}

extension Date{
    func daysInBetweenDate(date: Date) -> Double
    {
        var diff = timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/86400)
        return diff
    }
    
    func hoursInBetweenDate(date: Date) -> Double
    {
        var diff = timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/3600)
        return diff
    }
    
    func minutesInBetweenDate(date: Date) -> Double
    {
        var diff = timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/60)
        return diff
    }
    
    func secondsInBetweenDate(date: Date) -> Double
    {
        var diff = timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }
}

extension UIImageView{
    func roundImage()
    {
        //height and width should be the same
        clipsToBounds = true
        layer.cornerRadius = frame.size.width / 2;
    }
}

extension UIImage{
    func croppedImage(bound : CGRect) -> UIImage
    {
        let scaledBounds : CGRect = CGRect(x: bound.origin.x * scale, y: bound.origin.y * scale, width: bound.size.width * scale, height: bound.size.height * scale)
        let imageRef = cgImage?.cropping(to: scaledBounds)
        let croppedImage : UIImage = UIImage(cgImage: imageRef!, scale: scale, orientation: UIImageOrientation.up)
        return croppedImage;
    }
}


