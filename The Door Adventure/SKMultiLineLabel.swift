//
//  SKMultiLineLabel.swift
//  The Door Adventure
//
//  Created by Angel Kukushev on 5/28/16.
//  Copyright © 2016 Angel Kukushev. All rights reserved.
//
/*
import SpriteKit

class SKMultilineLabel: SKNode {
    //props
    var labelWidth:Int {didSet {update()}}
    var labelHeight:Int = 0
    var text:String {didSet {update()}}
    var fontName:String {didSet {update()}}
    var fontSize:CGFloat {didSet {update()}}
    var pos:CGPoint {didSet {update()}}
    var fontColor:UIColor {didSet {update()}}
    var leading:Int {didSet {update()}}
    var alignment:SKLabelHorizontalAlignmentMode {didSet {update()}}
    var dontUpdate = false
    var shouldShowBorder:Bool = false {didSet {update()}}
    //display objects
    var rect:SKShapeNode?
    var labels:[SKLabelNode] = []
    
    init(text:String, labelWidth:Int, pos:CGPoint, fontName:String="ChalkboardSE-Regular",fontSize:CGFloat=10,fontColor:UIColor=UIColor.blackColor(),leading:Int=10, alignment:SKLabelHorizontalAlignmentMode = .Center, shouldShowBorder:Bool = false)
    {
        self.text = text
        self.labelWidth = labelWidth
        self.pos = pos
        self.fontName = fontName
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.leading = leading
        self.shouldShowBorder = shouldShowBorder
        self.alignment = alignment
        
        super.init()
        
        self.update()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //if you want to change properties without updating the text field,
    //  set dontUpdate to false and call the update method manually.
    func update() {
        if (dontUpdate) {return}
        if (labels.count>0) {
            for label in labels {
                label.removeFromParent()
            }
            labels = []
        }
        let separators = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        let words = text.componentsSeparatedByCharactersInSet(separators)
        
        let len = text.characters.count
        
        var finalLine = false
        var wordCount = -1
        var lineCount = 0
        while (!finalLine) {
            lineCount += 1
            var lineLength = CGFloat(0)
            var lineString = ""
            var lineStringBeforeAddingWord = ""
            
            // creation of the SKLabelNode itself
            var label = SKLabelNode(fontNamed: fontName)
            // name each label node so you can animate it if u wish
            label.name = "line\(lineCount)"
            label.horizontalAlignmentMode = alignment
            label.fontSize = fontSize
            label.fontColor = UIColor.blackColor()
            
            while lineLength < CGFloat(labelWidth)
            {
                wordCount += 1
                if wordCount > words.count-1
                {
                    //label.text = "\(lineString) \(words[wordCount])"
                    finalLine = true
                    break
                }
                else
                {
                    lineStringBeforeAddingWord = lineString
                    lineString = "\(lineString) \(words[wordCount])"
                    label.text = lineString
                    lineLength = 1.0
                }
            }
            if lineLength > 0 {
                wordCount -= 1
                if (!finalLine) {
                    lineString = lineStringBeforeAddingWord
                }
                label.text = lineString
                var linePos = pos
                if (alignment == .Left) {
                    linePos.x -= CGFloat(labelWidth / 2)
                } else if (alignment == .Right) {
                    linePos.x += CGFloat(labelWidth / 2)
                }
                linePos.y += CGFloat(-leading * lineCount)
                label.position = CGPointMake( linePos.x , linePos.y )
                self.addChild(label)
                labels.append(label)
                //println("was \(lineLength), now \(label.width)")
            }
            
        }
        labelHeight = lineCount * leading
        showBorder()
    }
    func showBorder() {
        if (!shouldShowBorder) {return}
        if let rect = self.rect {
            self.removeChildrenInArray([rect])
        }
        self.rect = SKShapeNode(rectOfSize: CGSize(width: labelWidth, height: labelHeight))
        if let rect = self.rect {
            rect.strokeColor = UIColor.whiteColor()
            rect.lineWidth = 1
            rect.position = CGPoint(x: pos.x, y: pos.y - (CGFloat(labelHeight) / 2.0))
            self.addChild(rect)
        }
        
    }
}
 
 /* // no paragraphs




import SpriteKit

class SKMultilineLabel: SKNode {
    //props
    var labelWidth:Int {didSet {update()}}
    var labelHeight:Int = 0
    var text:String {didSet {update()}}
    var fontName:String {didSet {update()}}
    var fontSize:CGFloat {didSet {update()}}
    var pos:CGPoint {didSet {update()}}
    var fontColor:SKColor {didSet {update()}}
    var leading:Int {didSet {update()}}
    var alignment:SKLabelHorizontalAlignmentMode {didSet {update()}}
    var dontUpdate = false
    var shouldShowBorder:Bool = false {didSet {update()}}
    //display objects
    var rect:SKShapeNode?
    var labels:[SKLabelNode] = []
    
    init(text:String, labelWidth:Int, pos:CGPoint, fontName:String="ChalkboardSE-Regular",fontSize:CGFloat=10,fontColor:SKColor=SKColor.blackColor(),leading:Int=10, alignment:SKLabelHorizontalAlignmentMode = .Center, shouldShowBorder:Bool = false)
    {
        self.text = text
        self.labelWidth = labelWidth
        self.pos = pos
        self.fontName = fontName
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.leading = leading
        self.shouldShowBorder = shouldShowBorder
        self.alignment = alignment
        
        super.init()
        
        self.update()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //if you want to change properties without updating the text field,
    //  set dontUpdate to false and call the update method manually.
    func update() {
        if (dontUpdate) {return}
        if (labels.count>0) {
            for label in labels {
                label.removeFromParent()
            }
            labels = []
        }
        let separators = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        let lineSeparators = NSCharacterSet.newlineCharacterSet()
        let paragraphs = text.componentsSeparatedByCharactersInSet(lineSeparators)
        
        var lineCount = 0
        for (_, paragraph) in paragraphs.enumerate() {
            let words = paragraph.componentsSeparatedByCharactersInSet(separators)
            var finalLine = false
            var wordCount = -1
            while (!finalLine) {
                lineCount++
                var lineLength = CGFloat(0)
                var lineString = ""
                var lineStringBeforeAddingWord = ""
                
                // creation of the SKLabelNode itself
                let label = SKLabelNode(fontNamed: fontName)
                // name each label node so you can animate it if u wish
                label.name = "line\(lineCount)"
                label.horizontalAlignmentMode = alignment
                label.fontSize = fontSize
                label.fontColor = SKColor.blackColor()
                
                while lineLength < CGFloat(labelWidth)
                {
                    wordCount++
                    if wordCount > words.count-1
                    {
                        //label.text = "\(lineString) \(words[wordCount])"
                        finalLine = true
                        break
                    }
                    else
                    {
                        lineStringBeforeAddingWord = lineString
                        lineString = "\(lineString) \(words[wordCount])"
                        label.text = lineString
                        lineLength = label.frame.size.width
                    }
                }
                if lineLength > 0 {
                    wordCount--
                    if (!finalLine) {
                        lineString = lineStringBeforeAddingWord
                    }
                    label.text = lineString
                    var linePos = pos
                    if (alignment == .Left) {
                        linePos.x -= CGFloat(labelWidth / 2)
                    } else if (alignment == .Right) {
                        linePos.x += CGFloat(labelWidth / 2)
                    }
                    linePos.y += CGFloat(-leading * lineCount)
                    label.position = CGPointMake( linePos.x , linePos.y )
                    self.addChild(label)
                    labels.append(label)
                    //println("was \(lineLength), now \(label.width)")
                }
            }
        }
        labelHeight = lineCount * leading
        showBorder()
        print(labelHeight)
        print(fontSize)
    }
    
    func showBorder() {
        if (!shouldShowBorder) {return}
        if let rect = self.rect {
            self.removeChildrenInArray([rect])
        }
        self.rect = SKShapeNode(rectOfSize: CGSize(width: labelWidth, height: labelHeight))
        if let rect = self.rect {
            rect.strokeColor = SKColor.whiteColor()
            rect.lineWidth = 1
            rect.position = CGPoint(x: pos.x, y: pos.y - (CGFloat(labelHeight) / 2.0))
            self.addChild(rect)
        }
        print(labelHeight)
        print(fontSize)
    }
}
 */
 */
