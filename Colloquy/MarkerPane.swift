//
//  MarkerPane.swift
//  Colloquy
//
//  Created by Josiah Gaskin on 5/26/15.
//  Copyright (c) 2015 Colloquy. All rights reserved.
//

import CoreFoundation
import UIKit

class MarkerPane : UIView {
    var markerLines : [CGFloat] = []
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextSetLineWidth(context, 2.0)
        
        for y in markerLines {
            CGContextMoveToPoint(context, 0.0, y)
            CGContextAddLineToPoint(context, self.bounds.size.width, y)
            CGContextStrokePath(context)
        }
    }
    
    func insertMarker(yCoord: CGFloat) {
        self.markerLines.append(yCoord)
        self.setNeedsDisplay()
    }
    
    func tick(bufferSize: Int32) {
        self.scrollBy(CGFloat(1.0/Double(bufferSize)))
    }
    
    // Scroll all lines by a proportion of total height (0.0-1.0)
    func scrollBy(value: CGFloat) {
        let diff = value * self.bounds.size.height
        self.markerLines = self.markerLines.map({ (y) in
            return y - diff
            }).filter({ (y) in
                return y > 0
            })
        self.setNeedsDisplay()
    }
}