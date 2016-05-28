//
//  Awesome.swift
//  The Door Adventure
//
//  Created by Angel Kukushev on 5/27/16.
//  Copyright © 2016 Angel Kukushev. All rights reserved.
//

import SpriteKit

var continueButton: SKNode! = nil

class Awesome: SKScene {
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Loop over all the touches in this event
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.locationInNode(self)
            // Check if the location of the touch is within the button's bounds
            if continueButton.containsPoint(location) {
              
                
                
            }
        }
    }
    
    init(size: CGSize, argument:Int, points: Int) {
        
        super.init(size: size)
        
        backgroundColor = SKColor.whiteColor()
        

        let label = SKLabelNode(fontNamed: "Copperplate")
        
        continueButton = SKSpriteNode(imageNamed:"continueButton")
        //  label.text = message + "\n" + "Your score is: " + "\(points)"
        label.text = "Ти избра да си астронавт."
        
        label.fontSize = 30
        label.fontColor = SKColor.blackColor()
        label.position = CGPoint(x: size.width/2, y: CGRectGetMaxY(self.frame) - 40)

        continueButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        //button.setScale(0.5)
        
        
        addChild(label)
        
        addChild(continueButton)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMoveToView(view: SKView) {
        
    }
}