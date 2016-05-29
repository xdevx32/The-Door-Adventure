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

var optionOneButton: SKNode! = nil

var optionTwoButton: SKNode! = nil

var diamond: SKNode! = nil

var diamondLabel: SKLabelNode! = nil

var downButtonMargin: CGFloat  = 80.0

class Awesome: SKScene {
    
    var continueTextLabel: SKLabelNode! = nil
    
    var tapBar: SKShapeNode! = nil
   
    var optionOneTextLabel: SKLabelNode! = nil
    
    var optionTwoTextLabel: SKLabelNode! = nil
    
    var labelArray: [SKLabelNode] = [SKLabelNode]()
    
    var linesArray: [String] = [String]()
    
    var textForButtons: [String] = [String]()

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Loop over all the touches in this event
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.locationInNode(self)
            // Check if the location of the touch is within the button's bounds
            if continueButton.containsPoint(location) {
                
            
        
                //self.removeAllChildren()
                
                
                let playScene = Awesome(size: self.size, text: linesArray, answers: textForButtons, points: 0)
                playScene.scaleMode = .AspectFill
                self.view?.presentScene(playScene, transition: fadeColorEffect)
                
                defaults.setBool(false, forKey: "toContinue")
                 // boom
                
               
            }
        }
    }
    override init(){
        super.init()
    }
    init(size: CGSize,text:[String] ,answers:[String], points: Int) {
        
        super.init(size: size)
       
        let scenariosCount = defaults.integerForKey("miniScenarios")
        print("Scenario count:" + String(scenariosCount))
        
        
        
        
        // the tab bar on top
        tapBar = SKShapeNode(rectOfSize: CGSize(width: self.frame.width, height: 6))
        tapBar.name = "bar"
        tapBar.fillColor = SKColor.blackColor()
        tapBar.zPosition = 1
        tapBar.position.x = CGRectGetMidX(self.frame)
        tapBar.position.y = CGRectGetMaxY(self.frame) - 50
    
        
        self.addChild(tapBar)
        
        //
        
        diamond = SKSpriteNode(imageNamed:"diamondRed")
        
        diamond.position = CGPoint(x:frame.width - 300.0, y:CGRectGetMaxY(self.frame) - 27)
        print(frame.width)
        print(diamond)
        print(CGRectGetMaxX(self.frame))
        print(CGRectGetMaxX(self.frame) * 0.87)
        print(CGRectGetMidX(self.frame))
        diamond.zPosition = 1
        
        diamond.setScale(0.3)
    
       // self.addChild(diamond)
        // end tap bar
        
        
        
        
        
        // Every line can have 33 letters
  
        
        
        
        
        
        
        
        
        if scenariosCount == 1 {
            
            linesArray = ["Беше 9 часа в събота и дъждът не ",
                          "спираше да вали. Ти се събуди от",
                          "чукане на вратата. Странно, не",
                          "очакваше никого. ",
                          "",
                          "",
                          "",
                          "",
                          "",
                          ""]
            
            textForButtons = ["","Сън","Отвори"]
            
        } else if scenariosCount == 2 {
            linesArray = ["Ти отвори врата и пред теб стоеше",
                          "напълно непознат човек. Нямаше ",
                          "чадър, наблизо нямаше и спряна ",
                          "кола, а той не беше мокър. ",
                          "Непознатият се усмихна и каза:",
                          "`Здравей, <никнейм> !!` ",
                          "От къде ли знаеше той името ти ?",
                          "",
                          "",
                          ""]
            
            textForButtons = ["Купи си бира","Затвори вратата","Поздрави го"]
            
        } else if scenariosCount == 3 {
            linesArray = ["Непознатият мина покрай теб,",
                          "влезе и седна на дивана абсолютно",
                          "непоканен. `Нямаше много време`",
                          " каза той и извади подробна ",
                          "карта на града.Огради три места ",
                          "с химикал и каза: След 30 минути",
                          " трябва да си на едно от тези",
                          " места. Избери мъдро !",
                          "",
                          ""]
            
            textForButtons = ["Хапни сникърс","","Продължи"]
            
        }else if scenariosCount == 4 {
            linesArray = ["Непознатият остави картата на ",
                          "масата и излезе също също ",
                          "толкова неочаквано, колкото ",
                          "беше влязъл. Ти нямаше нищо ",
                          "по-добро за правене днес, затова",
                          "не се замисли много и избра ",
                          "едно от местата.А те бяха: ",
                          "ресторант,магазин за играчки и ",
                          "парк. И трите се намираха наблизо,",
                          "но никога не беше идвал за тях."
                           ]
            
            textForButtons = ["Магазин","Парк","Ресторант"]
            
        }else if scenariosCount == 5 {
            linesArray = ["Облече се набързо и след",
                          "20 минути беше пред вратата.",
                          "Отвори, а гледката вътре те",
                          "озадачи. Нямаше сервитьорки",
                          "нито готвачи. Чинии с храна",
                          "преминаваха покрай теб",
                          "на странни маси, които се",
                          "предвижваха сами към насядалите",
                          "клиенти. Срещу теб имаше голям",
                          "електронен часовник."]
            
            textForButtons = ["","","Продължи"]
            
        }else if scenariosCount == 6 {
            linesArray = ["Един възрастен мъж остави",
                          "закуската си, стана и се обърна",
                          " към теб.",
                          "`А, вие дойдохте все пак <име>.",
                          "Очаквахме ви.`",
                          "",
                          "Имам машина на времето",
                          "Искаш ли да пътуваме",
                          "",
                          ""]
            
            textForButtons = ["","","Пфф арее !"]
            
        }else if scenariosCount == 7 {
            linesArray = ["Край на историята за сега !",
                          "",
                          "",
                          "",
                          "",
                          "HACK FMI 7 RULES !",
                          "",
                          "",
                          "",
                          ""]
            
            textForButtons = ["","","Играй отново!"]
            
            
            diamond = SKSpriteNode(imageNamed:"diamondRed")
            
            diamond.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
            print(frame.width)
            print(diamond)
            print(CGRectGetMaxX(self.frame))
            print(CGRectGetMaxX(self.frame) * 0.87)
            print(CGRectGetMidX(self.frame))
            diamond.zPosition = 1
            
            diamond.setScale(3)
            
            
            diamond.setScale(0.3)
            
           var moveDiamond = SKAction.moveTo(CGPoint(x:frame.width - 300.0, y:CGRectGetMaxY(self.frame) - 27),duration: 4.0)
            
            
            self.addChild(diamond)
            
            diamond.runAction(moveDiamond)
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        defaults.setInteger(scenariosCount + 1, forKey: "miniScenarios")
        
        backgroundColor = SKColor.whiteColor()
        
        var 😱:CGFloat = 60.0
       
        // АМИ ТУКА ВСИЧКО СТАНА АМА НИКАКВА ИДЕЯ КАК. ДАЖЕ ДА СИ КАЖА ЧЕСТНО НЕ ИСКАМ ДА ЗНАМ...
        
        //738.0
        
        for i in 0...9 {
            😱 = 😱 + 30.0
            
            labelArray.append(SKLabelNode(fontNamed: "AppleSDGothicNeo-UltraLight"))
            labelArray[i].name = "Изречение: " + String(i)
            labelArray[i].position.x = self.frame.midX
            labelArray[i].zPosition = 1
            labelArray[i].position.y = CGRectGetMaxY(self.frame) - 😱
            
            labelArray[i].text = linesArray[i]

            labelArray[i].fontColor = SKColor.blackColor()
          //  print(labelArray[i])
            addChild(labelArray[i])
        }
        
        // Option One, Stays on top of continueButton
        // BUTTON CODE
        
        
        optionOneButton = SKSpriteNode(imageNamed:"rawButton")
        
        optionOneButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMinY(self.frame) + downButtonMargin)
        
        
        // END BUTTON CODE
        
        // LABEL CODE
        optionOneTextLabel = SKLabelNode(fontNamed: "AppleSDGothicNeo-UltraLight")
        
        optionOneTextLabel.text = textForButtons[1]

        optionOneTextLabel.fontSize = 25
        
        optionOneTextLabel.fontColor = SKColor.whiteColor()
        
        optionOneTextLabel.position.x = self.frame.midX

        optionOneTextLabel.zPosition = 1
    
        optionOneTextLabel.position.y = optionOneButton.position.y - optionOneButton.frame.size.height/4
        
        optionOneTextLabel.color = UIColor.whiteColor()
        
        // END LABEL CODE
        
        
        // Option Two, stays on top of Option One
        // BUTTON CODE
        
        
        optionTwoButton = SKSpriteNode(imageNamed:"rawButton")
        
        optionTwoButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMinY(self.frame) + downButtonMargin + 50.0)
        
        
        // END BUTTON CODE
        
        // LABEL CODE
        optionTwoTextLabel = SKLabelNode(fontNamed: "AppleSDGothicNeo-UltraLight")
        
        optionTwoTextLabel.text = textForButtons[0]
        
        optionTwoTextLabel.fontSize = 25
        
        optionTwoTextLabel.fontColor = SKColor.whiteColor()
        
        optionTwoTextLabel.position.x = self.frame.midX
        
        optionTwoTextLabel.zPosition = 1
        
        optionTwoTextLabel.position.y = optionTwoButton.position.y - optionTwoButton.frame.size.height/4
        
        optionTwoTextLabel.color = UIColor.whiteColor()
        
        // END LABEL CODE

        
        
        
        // ADDING CHILDS
    
        if "" != textForButtons[1]{
            addChild(optionOneTextLabel)
            addChild(optionOneButton)
        }
    
        if "" != textForButtons[0]{
            addChild(optionTwoTextLabel)
            addChild(optionTwoButton)
            
        }
 
        // Continue button
        
        continueButton = SKSpriteNode(imageNamed:"rawButton")
        continueButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMinY(self.frame) + 30)
        print(CGRectGetMidX(self.frame))
        // LABEL CODE
        continueTextLabel = SKLabelNode(fontNamed: "AppleSDGothicNeo-UltraLight")
        
        continueTextLabel.text = textForButtons[2]
        
        continueTextLabel.fontSize = 25
        
        continueTextLabel.fontColor = SKColor.whiteColor()
        
        continueTextLabel.position.x = self.frame.midX
        
        continueTextLabel.zPosition = 1
        
        continueTextLabel.position.y = continueButton.position.y - continueButton.frame.size.height/4
        
        // END LABEL CODE

        addChild(continueButton)
        addChild(continueTextLabel)

        // end continue button
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMoveToView(view: SKView) {
        
    }
}