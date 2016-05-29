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

var fadeColorEffect: SKTransition = SKTransition.fadeWithColor(UIColor.blackColor(), duration: 3)

var moveInEffect: SKTransition = SKTransition.moveInWithDirection(.Up, duration: 1.5)

class DoorsScene: SKScene {
    /*
    init(size: CGSize, argument:Int) {
        
        super.init(size: size)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   */
    
    // causes error in GameViewController
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Loop over all the touches in this event
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.locationInNode(self)
            // Check if the location of the touch is within the button's bounds
            
            if doorFive.containsPoint(location) {
                print("Door one selected !")
                
                
                linesArray = ["Беше 9 часа в събота и дъждът не ",
                              "спираше да вали. Ти се събуди от",
                              "чукане на вратата. Странно, не",
                              "очакваше никого. ",
                              "",
                              "",
                              ""]
                
                textForButtons = ["Отвори","Продължи"]
                
                
                
                let playScene = Awesome(size: self.size, text: linesArray, answers: textForButtons, points: 0)

                playScene.scaleMode = .AspectFill
                self.view?.presentScene(playScene, transition: fadeColorEffect)
                
            }
            
        }
    }
    
    
  

    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = UIColor.whiteColor()
        
        doorFive = SKSpriteNode(imageNamed: "door")
        doorFive.position = CGPoint(x:CGRectGetMidX(self.frame) ,y:CGRectGetMidY(self.frame))
        doorFive.zPosition = 1
        self.addChild(doorFive)
        
    }
    
        override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
