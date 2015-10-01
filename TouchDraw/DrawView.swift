//
//  DrawView.swift
//  TouchDraw
//
//  Created by Anjel Villafranco on 9/30/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var lines = [Line]()
    
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        
        UIColor.magentaColor().set()
        
        for line in lines {
            
            if let start = line.start, let end = line.end {
                
                if let fillColor = line.fillColor {
                    
                    fillColor.set()
                    
                    
                }
                
                if let strokeColor = line.strokeColor {
                    
                    strokeColor.set()
                    
                    CGContextSetLineWidth(context, line.strokeWidth)
                    
                    CGContextSetLineCap(context, .Round)
                    CGContextSetLineJoin(context, .Round)
                    
                    CGContextMoveToPoint(context, start.x, start.y)
                    
//                    if line is Scribble {
//                        
//                        
//                    
//                    }
                    
                    if let scribble = line as? Scribble {
                        
                        CGContextAddLines(context, scribble.points, scribble.points.count)


                    }
                    
                    CGContextAddLineToPoint(context, end.x, end.y)
                        
                
                    
                    CGContextStrokePath(context)
                    
                }
                
            }
            
        }
        
    }
    
}

class Line {
    
    var start: CGPoint?
    var end: CGPoint?
    
    var strokeColor: UIColor?
    var fillColor: UIColor?
    
    var strokeWidth: CGFloat = 0
    
}

class Scribble: Line {
    
    var points = [CGPoint]() {
        
        didSet {
            
            start = points.first
            
            end = points.last
            
        }
    }
}

//        CGContextMoveToPoint(context, 20, 20)
//
//        CGContextAddLineToPoint(context, 100, 100)
//
//        CGContextMoveToPoint(context, 200, 200)
//
//        CGContextAddLineToPoint(context, 200, 100)
//
//        CGContextStrokePath(context)


//        CGContextAddEllipseInRect(context, CGRect(x: 20, y:20, width: 200, height: 200))
//
//        CGContextAddEllipseInRect(context, CGRect(x: 100, y:100, width: 200, height: 200))
//
//        UIColor.cyanColor().set()
//
//        CGContextFillPath(context)
//


//        CGContextFillEllipseInRect(context, CGRect(x: 10, y: 10, width: 200, height: 100))
//
//        UIColor.cyanColor().set()
//
//        CGContextStrokeRect(context, CGRect(x: 200, y: 10, width: 100, height: 100))









