//
//  GameScene.swift
//  tekubimon-iphone
//
//  Created by William Shi on 5/1/16.
//  Copyright (c) 2016 William Shi. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let bm_sheet = Black_Mage()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        //myLabel.text = "Hello, World!"
        //myLabel.fontSize = 45
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        //self.addChild(myLabel)
        
        self.backgroundColor = SKColor.blackColor()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        /*for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }*/
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func spawnPet(){
        //let bm = SKSpriteNode(texture: bm_sheet.move_1())
        
        //Set position and physics body stuff
        //hero1.name = "hero1"
        //hero1.position = CGPoint(x: 160, y: 260)
        //hero1.zPosition = 3
        //hero1.setScale(0.5)
        
        //Add to scene
        /*background.addChild(bm)
        
        // Create the unit
        let unit = Unit(spriteNode: bm, hp: 5, def: 0, dmg: 1)
        
        //Animates the hero
        let run = SKAction.animateWithTextures(bm_sheet.move(), timePerFrame: 0.1)
        let action = SKAction.repeatActionForever(run)
        bm.runAction(action)
        
        //Moves hero rightward forever
        moveRight(hero1)
        
        // Add to player's spawned units
        playerUnits.push(unit)
 */
    }
}
