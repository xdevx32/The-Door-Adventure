//
//  GameScene.swift
//  The Door Adventure
//
//  Created by Angel Kukushev on 5/27/16.
//  Copyright (c) 2016 Angel Kukushev. All rights reserved.
//

import SpriteKit


var doorOne: SKNode! = nil

var doorTwo: SKNode! = nil

var doorThree: SKNode! = nil

var doorFour: SKNode! = nil

var doorFive: SKNode! = nil

var doorSix: SKNode! = nil

var doorSeven: SKNode! = nil

var doorEight: SKNode! = nil

var doorNine: SKNode! = nil

class DoorsScene: SKScene {
   
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Loop over all the touches in this event
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.locationInNode(self)
            // Check if the location of the touch is within the button's bounds
            if doorOne.containsPoint(location) {
                print("Door one selected !")
                let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                let playScene = Awesome(size: self.size, argument: 6, points: 0)
                self.view?.presentScene(playScene, transition: reveal)
                
            }
            
        }
    }
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = UIColor.whiteColor()
        
        doorOne = SKSpriteNode(imageNamed: "door")
        doorOne.position = CGPoint(x:CGRectGetMidX(self.frame) ,y:CGRectGetMidY(self.frame))
        doorOne.zPosition = 1
        self.addChild(doorOne)
        
    }
    
        override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
