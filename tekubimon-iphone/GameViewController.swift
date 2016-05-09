//
//  GameViewController.swift
//  tekubimon-iphone
//
//  Created by William Shi on 5/1/16.
//  Copyright (c) 2016 William Shi. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class GameViewController: UIViewController {
    
    var bmArray:[UIImage] = []

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var PetName: UILabel!
    @IBOutlet var Atk: UILabel!
    @IBOutlet var Def: UILabel!
    @IBOutlet var Hit: UILabel!
    @IBOutlet var Spd: UILabel!
    @IBOutlet var Hpy: UILabel!
    @IBOutlet var Lvl: UILabel!
    @IBOutlet var Pnt: UILabel!
    @IBOutlet var Steps: UILabel!
    //@IBOutlet var mainView: SKView!
    
    /*let healthManager: HealthKitManager = HealthKitManager()
    
    func authorizeHealthKit()
    {
        healthManager.authorizeHealthKit { (authorized,  error) -> Void in
            if authorized {
                print("HealthKit authorization received.")
            }
            else
            {
                print("HealthKit authorization denied!")
                if error != nil {
                    print("\(error)")
                }
            }
        }
    }*/
    
    
    func animate(){
        for index in 0...1{
            let strImageName : String = "black_mage_\(index).png"
            let image  = UIImage(named:strImageName)
            bmArray.append(image!)
        }
        
        self.imageView.layer.magnificationFilter = kCAFilterNearest
        self.imageView.layer.minificationFilter = kCAFilterNearest
        
        self.imageView.animationImages = bmArray
        self.imageView.animationDuration = 1.0
        self.imageView.startAnimating()
    }
    
    func loadPet(){
        let thePet = PetEnviroment()
        self.PetName.text = thePet.activePet.name
        self.Atk.text = String(thePet.activePet.attack)
        self.Def.text = String(thePet.activePet.defense)
        self.Hit.text = String(thePet.activePet.health)
        self.Spd.text = String(thePet.activePet.speed)
        self.Hpy.text = String(thePet.activePet.happiness)
        self.Lvl.text = String(thePet.activePet.level)
        self.Pnt.text = String(thePet.activePet.points)
        self.Steps.text = String(thePet.stepsTillBattle) + "Steps"
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let musicPath = NSBundle.mainBundle().URLForResource("loop_sound", withExtension: "wav")

        //do{
            //audioPlayer = try AVAudioPlayer(contentsOfURL: musicPath!)
        //}
        //catch{
            //fatalError("Error loading \(musicPath)")
        //}
        
        //authorizeHealthKit()

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
        //self.mainView.backgroundColor = [UIColor ]
        
        animate()

        
        loadPet()
        
        print("Play music")
        
        
        //do {
        //    audioPlayer = try AVAudioPlayer(contentsOfURL: musicPath!)
        //}
        //catch {
        //    fatalError("Error loading \(musicPath)")
        //}
        
        //audioPlayer.prepareToPlay()
        //audioPlayer.currentTime = 28
        
        //Play background music
        //audioPlayer.play()
        
        //Loop Forever
        //audioPlayer.numberOfLoops = -1
        
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
