//
//  ViewController.swift
//  TouchDraw
//
//  Created by Anjel Villafranco on 9/30/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var controlPanelTop: NSLayoutConstraint!
    
    @IBOutlet weak var controlPanelView: UIView!
    
    @IBAction func toggleControlPanel(sender: AnyObject) {
        
        self.controlPanelTop.constant = self.controlPanelView.frame.origin.y == 0 ? -200 : 0
        view.setNeedsUpdateConstraints()
        
        UIView.animateWithDuration(0.4) { () -> Void in
            
            self.view.layoutIfNeeded()
            
            
            
            
            
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            //
            //            let newLine = Line()
            //
            //            newLine.start = touch.locationInView(view)
            //            newLine.strokeColor = UIColor.blackColor()
            //            newLine.strokeWidth = 10
            //
            //            (view as? DrawView)?.lines.append(newLine)
            let newScribble = Scribble()
            
            newScribble.points.append(touch.locationInView(view))
            
            newScribble.strokeColor = UIColor.blackColor()
            newScribble.strokeWidth = 10
            
            (view as? DrawView)?.lines.append(newScribble)
            
            view.setNeedsDisplay()
            
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            
            //            if let currentLine = (view as? DrawView)?.lines.last {
            //
            //                currentLine.end = touch.locationInView(view)
            //
            //                view.setNeedsDisplay()
            //
            //            }
            if let currentScribble = (view as? DrawView)?.lines.last as? Scribble {
                
                currentScribble.points.append(touch.locationInView(view))
                
                view.setNeedsDisplay()
                
            }
        }
    }
}


