//
//  Awesome.swift
//  The Door Adventure
//
//  Created by Angel Kukushev on 5/27/16.
//  Copyright © 2016 Angel Kukushev. All rights reserved.
//

import SpriteKit

let defaults = NSUserDefaults.standardUserDefaults()

var continueButton: SKNode! = nil

var turnBackButton: SKNode! = nil

var labelArray: [SKLabelNode] = [SKLabelNode]()

class Awesome: SKScene {
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Loop over all the touches in this event
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.locationInNode(self)
            // Check if the location of the touch is within the button's bounds
            if continueButton.containsPoint(location) {
                let playScene = Awesome(size: self.size, argument: "Ти излетя в космоса и ще можещ да \n отидеш до различни други планети.", token: "1 1 2", points: 0)
                playScene.scaleMode = .AspectFill
                self.view?.presentScene(playScene, transition: fadeColorEffect)
                
                defaults.setBool(false, forKey: "toContinue")
                
            }
        }
    }
    
    init(size: CGSize, argument:String,token:String ,points: Int) {
        
        super.init(size: size)
       
        let scenariosCount = defaults.integerForKey("miniScenarios")
       
        defaults.setInteger(scenariosCount + 1, forKey: "miniScenarios")
        
        backgroundColor = SKColor.whiteColor()
        /*
        let multiLabel = SKMultilineLabel(text: "", labelWidth: 400, pos: CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame) - 40))
     
        multiLabel.fontName = "AppleSDGothicNeo-UltraLight"
    
        addChild(multiLabel)
        */
        labelArray.append(SKLabelNode(fontNamed: "AppleSDGothicNeo-UltraLight"))
        labelArray[0].fontColor = SKColor.blackColor()
        labelArray[0].position = CGPoint(x: CGRectGetMidX(self.frame),y:CGRectGetMidY(self.frame))
        addChild(labelArray[0])
      //  var някакъв_педалски_итератор:CGFloat = 600.0
       // var testLabel = SKLabelNode(fontNamed: "AppleSDGothicNeo-UltraLight")
      
        
        /*
        for i in 0...7 {
            някакъв_педалски_итератор = някакъв_педалски_итератор - 30.0
            labelArray.append(SKLabelNode(fontNamed: "AppleSDGothicNeo-UltraLight"))
            
            labelArray[i].position = CGPoint(x: CGRectGetMidX(self.frame) + някакъв_педалски_итератор, y: (CGRectGetMaxY(self.frame) - 40))
           
            labelArray[i].text = "ЙЕС БЕЕЕЕЕЕЕЕЕЕЕЕЕЕЕ"
            labelArray[i].color = SKColor.blackColor()
            
            addChild(labelArray[i])
        }
        
        
        */
       // if defaults.boolForKey("toContinue") == true {
        if scenariosCount % 10 == 0 || scenariosCount == 1 {
            
            turnBackButton = SKSpriteNode(imageNamed:"turnBackButton")
            
            turnBackButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMinY(self.frame) + 80)
            addChild(turnBackButton)
            
        } else{
        
        
        }
        
        
        // Continue button
        
        continueButton = SKSpriteNode(imageNamed:"continueButton")
        continueButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMinY(self.frame) + 30)
        addChild(continueButton)

        // end continue button
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMoveToView(view: SKView) {
        
    }
}