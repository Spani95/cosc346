//
//  stretchView.swift
//  assignment2
//
//  Created by Nicholas Sparrow on 9/29/16.
//  Copyright © 2016 Nicholas Sparrow. All rights reserved.
//



import Cocoa

class StretchView: NSView {
    
    var path = NSBezierPath()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        srandom(2)
        path.lineWidth = 3.0
        var p:NSPoint = self.randomPoint()
        path.moveToPoint(p)
        
        for _ in 0...14 {
            p = self.randomPoint()
            path.lineToPoint(p)
        }
        path.closePath()
    }
    
    func randomPoint()->NSPoint {
        let r:NSRect = self.bounds
        let nx = r.origin.x + CGFloat(random() % Int(r.size.width))
        let ny = r.origin.y + CGFloat(random() % Int(r.size.height))
        return NSPoint(x: nx, y: ny)
    }
    
//    override func drawRect(dirtyRect: NSRect) {
//        super.drawRect(dirtyRect)
//        let bounds = self.bounds
//        NSColor.greenColor().set()
//        NSBezierPath.fillRect(bounds)
//        
//        NSColor.whiteColor().set()
//        path.stroke()
//    }
    
    override var intrinsicContentSize: NSSize {
        return NSSize(width: 400, height: 400)
    }
    
    override func mouseDown(theEvent: NSEvent) {
        NSLog("mouseDown: \(theEvent.clickCount)")
    }
    override func mouseDragged(theEvent: NSEvent) {
        NSLog("mouseDragged: \(theEvent.locationInWindow)")
    }
    override func mouseUp(theEvent: NSEvent) {
        NSLog("mouseUp:")
    }
}