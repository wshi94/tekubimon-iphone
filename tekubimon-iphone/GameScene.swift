
import SpriteKit

class GameScene: SKScene {
    
    
 
    var playerTextureAtlas = SKTextureAtlas(named:"petdragon.atlas")
    var bossTextureAtlas = SKTextureAtlas(named:"bossstump.atlas")
    var playerSpriteArray = Array<SKTexture>();
    var playerSprite = SKSpriteNode();
    var bossSprite = SKSpriteNode();
    var bossSpriteArray = Array<SKTexture>();
    var attackbutton = SKSpriteNode();
    let petInfo = PetInfo.init();
    let bossInfo = BossInfo.init();
    var playerReady = false;
    var bossReady = false;
    
    override func didMoveToView(view: SKView) {
        

        
    
        attackbutton = self.childNodeWithName("AttackNode") as! SKSpriteNode;
        playerStands();
        bossStands();
        
    }
    
    
    
    
    func playerAttacks(){
        playerReady = false;
        playerSprite = self.childNodeWithName("PlayerNode") as! SKSpriteNode;
        let petType = getPetType();
        switch petType {
        case 1:
            playerTextureAtlas = SKTextureAtlas(named:"petdragon.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        case 2:
            playerTextureAtlas = SKTextureAtlas(named:"petlion.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        case 3:
            playerTextureAtlas = SKTextureAtlas(named:"petporcupine.atlas")
            playerSprite.size=CGSizeMake(120, 100)
        case 4:
            playerTextureAtlas = SKTextureAtlas(named:"yeti.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        default:
            playerTextureAtlas = SKTextureAtlas(named:"petdragon.atlas")
        }
        
        
        var playerMoveArray = petInfo.getInfo(petType, animation: "move");
        playerSpriteArray = Array<SKTexture>()
        for i in Int(playerMoveArray[0])...Int(playerMoveArray[1]) {
            playerSpriteArray.append(playerTextureAtlas.textureNamed(String(i)));
        }
        
        playerSprite.texture = playerSpriteArray[0]
        let playerMoveAction = SKAction.animateWithTextures(self.playerSpriteArray, timePerFrame: Double(playerMoveArray[2])/(Double(playerMoveArray[1])-Double(playerMoveArray[0])+1));
        
        var playerAttackArray = petInfo.getInfo(petType, animation: "attack");
        var playerAttackSpriteArray = Array<SKTexture>()
        for i in Int(playerAttackArray[0])...Int(playerAttackArray[1]) {
            playerAttackSpriteArray.append(playerTextureAtlas.textureNamed(String(i)));
        }
        
        let playerAttackAction = SKAction.animateWithTextures(playerAttackSpriteArray, timePerFrame: Double(playerAttackArray[2])/(Double(playerAttackArray[1])-Double(playerAttackArray[0])+1));
        
        
        //start player moving animation
        
        let playerMovementAction = SKAction.repeatActionForever(playerMoveAction);
        playerSprite.removeAllActions();
        self.playerSprite.runAction(playerMovementAction, withKey: "playerMoving");
        
        
        //move the player in sequence, occurs ASYNCHRONOUSLY.
        let moveAction = SKAction.moveTo(CGPointMake(500, 600), duration: 1.8)
        
        
        self.playerSprite.runAction(moveAction, completion: {
            
            //Asynchrnously trigger the bosshit function.
            self.bossHit(playerAttackArray[3]);
            self.playerSprite.removeAllActions();
            //attack and move back
            if(petType==3){
                self.playerSprite.size=CGSizeMake(200, 175)
            }
            self.playerSprite.runAction(playerAttackAction, completion: {
                self.playerMovesBack()});
            
            
        })
        
        
    }
    
    
    
    func playerMovesBack(){
        playerReady = false;
        playerSprite = self.childNodeWithName("PlayerNode") as! SKSpriteNode;
        let petType = getPetType();
        switch petType {
        case 1:
            playerTextureAtlas = SKTextureAtlas(named:"petdragon.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        case 2:
            playerTextureAtlas = SKTextureAtlas(named:"petlion.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        case 3:
            playerTextureAtlas = SKTextureAtlas(named:"petporcupine.atlas")
            playerSprite.size=CGSizeMake(150, 120)
        case 4:
            playerTextureAtlas = SKTextureAtlas(named:"yeti.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        default:
            playerTextureAtlas = SKTextureAtlas(named:"petdragon.atlas")
        }
        
        
        var playerarray = petInfo.getInfo(petType, animation: "move");
        playerSpriteArray = Array<SKTexture>()
        for i in Int(playerarray[0])...Int(playerarray[1]) {
            playerSpriteArray.append(playerTextureAtlas.textureNamed(String(i)));
        }
        
        playerSprite.texture = playerSpriteArray[0]
        let playerAnimateAction = SKAction.animateWithTextures(self.playerSpriteArray, timePerFrame: Double(playerarray[2])/(Double(playerarray[1])-Double(playerarray[0])+1));
        let moveAction = SKAction.moveTo(CGPointMake(1620, 600), duration: 1.8)
        let playerRepeatAction = SKAction.repeatActionForever(playerAnimateAction);
        self.playerSprite.runAction(playerRepeatAction);
        
        self.playerSprite.runAction(moveAction, completion: {
            self.playerStands()});
        
    }
    
    func playerHit(delay: NSNumber){
        playerReady = false;
        let delayDouble = Double(delay);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delayDouble * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            
            
            let petType = self.getPetType();
            
            switch petType {
            case 1:
                self.playerTextureAtlas = SKTextureAtlas(named:"petdragon.atlas")
                self.playerSprite.size=CGSizeMake(200, 200)
            case 2:
                self.playerTextureAtlas = SKTextureAtlas(named:"petlion.atlas")
                self.playerSprite.size=CGSizeMake(200, 200)
            case 3:
                self.playerTextureAtlas = SKTextureAtlas(named:"petporcupine.atlas")
                self.playerSprite.size=CGSizeMake(150, 120)
            case 4:
                self.playerTextureAtlas = SKTextureAtlas(named:"yeti.atlas")
                self.playerSprite.size=CGSizeMake(200, 200)
            default:
                self.playerTextureAtlas = SKTextureAtlas(named:"petdragon.atlas")
            }
            
            var playerarray = self.petInfo.getInfo(petType, animation: "hit");
            var tempSpriteArray = Array<SKTexture>();
            for i in Int(playerarray[0])...Int(playerarray[1]) {
                tempSpriteArray.append(self.playerTextureAtlas.textureNamed(String(i)));
            }
            
            let playerAction = SKAction.animateWithTextures(tempSpriteArray, timePerFrame: Double(playerarray[2])/(Double(playerarray[1])-Double(playerarray[0])+1));
            
            self.playerSprite.removeAllActions();
            self.playerSprite.runAction(playerAction, completion: {
                self.playerStands();
            });
            
            
        }
    }
    
    func playerStands(){
        playerReady = true;
        playerSprite = self.childNodeWithName("PlayerNode") as! SKSpriteNode;
        let petType = getPetType();
        switch petType {
        case 1:
            playerTextureAtlas = SKTextureAtlas(named:"petdragon.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        case 2:
            playerTextureAtlas = SKTextureAtlas(named:"petlion.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        case 3:
            playerTextureAtlas = SKTextureAtlas(named:"petporcupine.atlas")
            playerSprite.size=CGSizeMake(150, 120)
        case 4:
            playerTextureAtlas = SKTextureAtlas(named:"yeti.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        default:
            playerTextureAtlas = SKTextureAtlas(named:"petdragon.atlas")
        }
        
        
        var playerarray = petInfo.getInfo(petType, animation: "move");
        playerSpriteArray = Array<SKTexture>()
        for i in Int(playerarray[0])...Int(playerarray[1]) {
            playerSpriteArray.append(playerTextureAtlas.textureNamed(String(i)));
        }
        
        playerSprite.texture = playerSpriteArray[0]
        let playerAnimateAction = SKAction.animateWithTextures(self.playerSpriteArray, timePerFrame: Double(playerarray[2])/(Double(playerarray[1])-Double(playerarray[0])+1));
        
        let playerGroup = SKAction.group([playerAnimateAction])
        let playerRepeatAction = SKAction.repeatActionForever(playerGroup);
        playerSprite.removeAllActions();
        self.playerSprite.runAction(playerRepeatAction, withKey: "playerStanding");
 
    }
    
    
    func playerDeath(){
        playerReady = false;
        playerSprite = self.childNodeWithName("PlayerNode") as! SKSpriteNode;
        let petType = getPetType();
        switch petType {
        case 1:
            playerTextureAtlas = SKTextureAtlas(named:"petdragon.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        case 2:
            playerTextureAtlas = SKTextureAtlas(named:"petlion.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        case 3:
            playerTextureAtlas = SKTextureAtlas(named:"petporcupine.atlas")
            playerSprite.size=CGSizeMake(150, 120)
        case 4:
            playerTextureAtlas = SKTextureAtlas(named:"yeti.atlas")
            playerSprite.size=CGSizeMake(200, 200)
        default:
            playerTextureAtlas = SKTextureAtlas(named:"petdragon.atlas")
        }
        
        
        var playerarray = petInfo.getInfo(petType, animation: "death");
        playerSpriteArray = Array<SKTexture>()
        for i in Int(playerarray[0])...Int(playerarray[1]) {
            playerSpriteArray.append(playerTextureAtlas.textureNamed(String(i)));
        }
        
        playerSprite.texture = playerSpriteArray.last
        let playerAnimateAction = SKAction.animateWithTextures(self.playerSpriteArray, timePerFrame: Double(playerarray[2])/(Double(playerarray[1])-Double(playerarray[0])+1));
        playerSprite.removeAllActions();
        self.playerSprite.runAction(playerAnimateAction, withKey: "playerDead");
        
    }
    
    
    func bossAttacks(){
        bossReady = false;
        bossSprite = self.childNodeWithName("BossNode") as! SKSpriteNode;
        let bossType = getBossType();
        switch bossType {
        case 1:
            bossTextureAtlas = SKTextureAtlas(named:"bossstump.atlas")
            bossSprite.size=CGSizeMake(200, 200)
        case 2:
            bossTextureAtlas = SKTextureAtlas(named:"bossskeleton.atlas")
            bossSprite.size=CGSizeMake(250, 250)
        case 3:
            bossTextureAtlas = SKTextureAtlas(named:"bossmushroom.atlas")
            bossSprite.size=CGSizeMake(250, 250)
        case 4:
            bossTextureAtlas = SKTextureAtlas(named:"bossdragon.atlas")
            bossSprite.size=CGSizeMake(300, 225)
        case 5:
            bossTextureAtlas = SKTextureAtlas(named:"bossbalrog.atlas")
            bossSprite.size=CGSizeMake(400, 400)
        case 6:
            bossTextureAtlas = SKTextureAtlas(named:"bosstree.atlas")
            bossSprite.size=CGSizeMake(350, 300)
        default:
            bossTextureAtlas = SKTextureAtlas(named:"bossstump.atlas")
        }
        
        
        var bossMoveArray = bossInfo.getInfo(bossType, animation: "move");
        bossSpriteArray = Array<SKTexture>()
        for i in Int(bossMoveArray[0])...Int(bossMoveArray[1]) {
            bossSpriteArray.append(bossTextureAtlas.textureNamed(String(i)));
        }
        
        bossSprite.texture = bossSpriteArray[0]
        let bossMoveAction = SKAction.animateWithTextures(self.bossSpriteArray, timePerFrame: Double(bossMoveArray[2])/(Double(bossMoveArray[1])-Double(bossMoveArray[0])+1));
        
        var bossAttackArray = bossInfo.getInfo(bossType, animation: "attack");
        var bossAttackSpriteArray = Array<SKTexture>()
        for i in Int(bossAttackArray[0])...Int(bossAttackArray[1]) {
            bossAttackSpriteArray.append(bossTextureAtlas.textureNamed(String(i)));
        }
        
        let bossAttackAction = SKAction.animateWithTextures(bossAttackSpriteArray, timePerFrame: Double(bossAttackArray[2])/(Double(bossAttackArray[1])-Double(bossAttackArray[0])+1));
        
        
        //start boss moving animation
        
        let bossMovementAction = SKAction.repeatActionForever(bossMoveAction);
        bossSprite.removeAllActions();
        self.bossSprite.runAction(bossMovementAction, withKey: "bossMoving");
        
        
        //move the boss in sequence, occurs ASYNCHRONOUSLY.
        let moveAction = SKAction.moveTo(CGPointMake(1350, 600), duration: 1.8)
        
        
        self.bossSprite.runAction(moveAction, completion: {
            
            //Asynchrnously trigger the bosshit function.
            self.playerHit(bossAttackArray[3]);
            self.bossSprite.removeAllActions();
            //attack and move back
            self.bossSprite.runAction(bossAttackAction, completion: {
                self.bossMovesBack()});
            
            
        })
        
        
    }
    
    
    func bossMovesBack(){
        bossReady = false;
        bossSprite = self.childNodeWithName("BossNode") as! SKSpriteNode;
        let bossType = getBossType();
        switch bossType {
        case 1:
            bossTextureAtlas = SKTextureAtlas(named:"bossstump.atlas")
            bossSprite.size=CGSizeMake(200, 200)
        case 2:
            bossTextureAtlas = SKTextureAtlas(named:"bossskeleton.atlas")
            bossSprite.size=CGSizeMake(250, 250)
        case 3:
            bossTextureAtlas = SKTextureAtlas(named:"bossmushroom.atlas")
            bossSprite.size=CGSizeMake(250, 250)
        case 4:
            bossTextureAtlas = SKTextureAtlas(named:"bossdragon.atlas")
            bossSprite.size=CGSizeMake(300, 225)
        case 5:
            bossTextureAtlas = SKTextureAtlas(named:"bossbalrog.atlas")
            bossSprite.size=CGSizeMake(400, 400)
        case 6:
            bossTextureAtlas = SKTextureAtlas(named:"bosstree.atlas")
            bossSprite.size=CGSizeMake(350, 300)
        default:
            bossTextureAtlas = SKTextureAtlas(named:"bossstump.atlas")
        }
        
        
        
        var bossarray = bossInfo.getInfo(bossType, animation: "move");
        bossSpriteArray = Array<SKTexture>()
        for i in Int(bossarray[0])...Int(bossarray[1]) {
            bossSpriteArray.append(bossTextureAtlas.textureNamed(String(i)));
        }
        
        bossSprite.texture = bossSpriteArray[0]
        let bossAnimateAction = SKAction.animateWithTextures(self.bossSpriteArray, timePerFrame: Double(bossarray[2])/(Double(bossarray[1])-Double(bossarray[0])+1));
        let moveAction = SKAction.moveTo(CGPointMake(300, 600), duration: 1.8)
        
        let bossRepeatAction = SKAction.repeatActionForever(bossAnimateAction);
        self.bossSprite.runAction(bossRepeatAction);
        
        self.bossSprite.runAction(moveAction, completion: {
            self.bossStands()});
        
    }
    
    
    
    func bossHit(delay: NSNumber){
        bossReady = false;
        let delayDouble = Double(delay);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delayDouble * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            
            
            let bossType = self.getBossType();
            
            switch bossType {
            case 1:
                self.bossTextureAtlas = SKTextureAtlas(named:"bossstump.atlas")
                self.bossSprite.size=CGSizeMake(200, 200)
            case 2:
                self.bossTextureAtlas = SKTextureAtlas(named:"bossskeleton.atlas")
                self.bossSprite.size=CGSizeMake(250, 250)
            case 3:
                self.bossTextureAtlas = SKTextureAtlas(named:"bossmushroom.atlas")
                self.bossSprite.size=CGSizeMake(250, 250)
            case 4:
                self.bossTextureAtlas = SKTextureAtlas(named:"bossdragon.atlas")
                self.bossSprite.size=CGSizeMake(300, 225)
            case 5:
                self.bossTextureAtlas = SKTextureAtlas(named:"bossbalrog.atlas")
                self.bossSprite.size=CGSizeMake(400, 400)
            case 6:
                self.bossTextureAtlas = SKTextureAtlas(named:"bosstree.atlas")
                self.bossSprite.size=CGSizeMake(350, 300)
            default:
                self.bossTextureAtlas = SKTextureAtlas(named:"bossstump.atlas")
            }
            
            var bossarray = self.bossInfo.getInfo(bossType, animation: "hit");
            var tempSpriteArray = Array<SKTexture>();
            for i in Int(bossarray[0])...Int(bossarray[1]) {
                tempSpriteArray.append(self.bossTextureAtlas.textureNamed(String(i)));
            }
            
            let bossAction = SKAction.animateWithTextures(tempSpriteArray, timePerFrame: Double(bossarray[2])/(Double(bossarray[1])-Double(bossarray[0])+1));
            
            self.bossSprite.removeAllActions();
            self.bossSprite.runAction(bossAction, completion: {
                self.bossStands()
            });
            
            
        }
    }
    
    
    func bossStands(){
        bossReady = true;
        bossSprite = self.childNodeWithName("BossNode") as! SKSpriteNode;
        
        let bossType = getBossType();
        
        switch bossType {
        case 1:
            bossTextureAtlas = SKTextureAtlas(named:"bossstump.atlas")
            bossSprite.size=CGSizeMake(200, 200)
        case 2:
            bossTextureAtlas = SKTextureAtlas(named:"bossskeleton.atlas")
            bossSprite.size=CGSizeMake(250, 250)
        case 3:
            bossTextureAtlas = SKTextureAtlas(named:"bossmushroom.atlas")
            bossSprite.size=CGSizeMake(250, 250)
        case 4:
            bossTextureAtlas = SKTextureAtlas(named:"bossdragon.atlas")
            bossSprite.size=CGSizeMake(300, 225)
        case 5:
            bossTextureAtlas = SKTextureAtlas(named:"bossbalrog.atlas")
            bossSprite.size=CGSizeMake(400, 400)
        case 6:
            bossTextureAtlas = SKTextureAtlas(named:"bosstree.atlas")
            bossSprite.size=CGSizeMake(350, 300)
        default:
            bossTextureAtlas = SKTextureAtlas(named:"bossstump.atlas")
        }
        
        var bossarray = bossInfo.getInfo(bossType, animation: "stand");
        bossSpriteArray = Array<SKTexture>();
        for i in Int(bossarray[0])...Int(bossarray[1]) {
            bossSpriteArray.append(bossTextureAtlas.textureNamed(String(i)));
        }
        bossSprite.texture = bossSpriteArray[0]
        let bossAnimateAction = SKAction.animateWithTextures(self.bossSpriteArray, timePerFrame: Double(bossarray[2])/(Double(bossarray[1])-Double(bossarray[0])+1));
        
        let bossGroup = SKAction.group([bossAnimateAction])
        let bossRepeatAction = SKAction.repeatActionForever(bossGroup);
        bossSprite.removeAllActions();
        self.bossSprite.runAction(bossRepeatAction, withKey: "bossStanding");
        
    }
    
    func bossDeath(){
        bossReady = true;
        bossSprite = self.childNodeWithName("BossNode") as! SKSpriteNode;
        
        let bossType = getBossType();
        
        switch bossType {
        case 1:
            bossTextureAtlas = SKTextureAtlas(named:"bossstump.atlas")
            bossSprite.size=CGSizeMake(200, 200)
        case 2:
            bossTextureAtlas = SKTextureAtlas(named:"bossskeleton.atlas")
            bossSprite.size=CGSizeMake(250, 250)
        case 3:
            bossTextureAtlas = SKTextureAtlas(named:"bossmushroom.atlas")
            bossSprite.size=CGSizeMake(250, 250)
        case 4:
            bossTextureAtlas = SKTextureAtlas(named:"bossdragon.atlas")
            bossSprite.size=CGSizeMake(300, 225)
        case 5:
            bossTextureAtlas = SKTextureAtlas(named:"bossbalrog.atlas")
            bossSprite.size=CGSizeMake(400, 400)
        case 6:
            bossTextureAtlas = SKTextureAtlas(named:"bosstree.atlas")
            bossSprite.size=CGSizeMake(350, 300)
        default:
            bossTextureAtlas = SKTextureAtlas(named:"bossstump.atlas")
        }
        
        var bossarray = bossInfo.getInfo(bossType, animation: "death");
        bossSpriteArray = Array<SKTexture>();
        for i in Int(bossarray[0])...Int(bossarray[1]) {
            bossSpriteArray.append(bossTextureAtlas.textureNamed(String(i)));
        }
        bossSprite.texture = bossSpriteArray.last
        let bossAnimateAction = SKAction.animateWithTextures(self.bossSpriteArray, timePerFrame: Double(bossarray[2])/(Double(bossarray[1])-Double(bossarray[0])+1));
        
        bossSprite.removeAllActions();
        self.bossSprite.runAction(bossAnimateAction, withKey: "bossDead");
        
    }
    
    
    
    override func update(currentTime: NSTimeInterval) {
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Loop over all the touches in this event
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.locationInNode(self)
            // Check if the location of the touch is within the button's bounds
            if attackbutton.containsPoint(location) {
                if playerReady && bossReady {
                    
                    //available methods
                    playerDeath();
                }
                
            }
        }
    }
    
    func getPetType() -> NSNumber{
        return 4;
    }
    
    func getBossType() -> NSNumber{
        return 5;
    }
    
    
    
}



