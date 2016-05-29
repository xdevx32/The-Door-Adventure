//
//  MenuScreen.swift
//  The Door Adventure
//
//  Created by Angel Kukushev on 5/29/16.
//  Copyright © 2016 Angel Kukushev. All rights reserved.
//


import SpriteKit
/*
var continueTextLabel: SKLabelNode! = nil

var optionOneTextLabel: SKLabelNode! = nil

var optionTwoTextLabel: SKLabelNode! = nil

var scenarioTypeLabel: SKLabelNode! = nil

var labelArray: [SKLabelNode] = [SKLabelNode]()

var linesArray: [String] = [String]()

var textForButtons: [String] = [String]()

var fadeColorEffect: SKTransition = SKTransition.fadeWithColor(UIColor.blackColor(), duration: 3)

var moveInEffect: SKTransition = SKTransition.moveInWithDirection(.Up, duration: 1.5)
*/



class MenuScene: SKScene {
    
    var playButton: SKNode! = nil

    var playTextLabel: SKLabelNode! = nil
    
    var title: SKLabelNode! = nil

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
            
            if playButton.containsPoint(location) {
        
        
                let playScene = DoorsScene(size: self.size)
                
                playScene.scaleMode = .AspectFill
                self.view?.presentScene(playScene, transition: fadeColorEffect)
                
            }
            
        }
    }
    
    
    
    
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = UIColor.whiteColor()
        
      
        title = SKLabelNode(fontNamed: "AppleSDGothicNeo-UltraLight")
        title.text = "The Door Adventure"
        title.fontColor = SKColor.blackColor()
        title.fontSize = 56
        title.position.x = CGRectGetMidX(self.frame)
        title.position.y = CGRectGetMaxY(self.frame) - 156
        title.zPosition = 1
        
        self.addChild(title)
        
        
        // play button
        
        playButton = SKSpriteNode(imageNamed:"rawButton")
        
        playButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMinY(self.frame) + 60)
        print(CGRectGetMidX(self.frame))
        // LABEL CODE
        playTextLabel = SKLabelNode(fontNamed: "AppleSDGothicNeo-UltraLight")
        
        playTextLabel.text = "Играй"
        
        playTextLabel.fontSize = 25
        
        playTextLabel.fontColor = SKColor.whiteColor()
        
        playTextLabel.position.x = self.frame.midX
        
        playTextLabel.zPosition = 1
        
        playTextLabel.position.y = playButton.position.y - playButton.frame.size.height/2
        
        // END LABEL CODE
        playButton.setScale(2)
        playTextLabel.setScale(2)
        
        addChild(playButton)
        addChild(playTextLabel)
        
        // end play button
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
