//
//  GameViewController.swift
//  tekubimon-iphone
//
//  Created by William Shi on 5/1/16.
//  Copyright (c) 2016 William Shi. All rights reserved.
//
import Foundation
import UIKit
import SpriteKit
import CoreData

class PetViewController: UIViewController {
    
    var bmArray:[UIImage] = []
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var petname: UILabel!
    @IBOutlet weak var atk: UILabel!
    @IBOutlet weak var def: UILabel!
    @IBOutlet weak var hit: UILabel!
    @IBOutlet weak var spd: UILabel!
    @IBOutlet weak var hpy: UILabel!
    @IBOutlet weak var lvl: UILabel!
    @IBOutlet weak var pnt: UILabel!
    @IBOutlet weak var steps: UILabel!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //authorizeHealthKit()
        
        /*if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }*/
        //self.mainView.backgroundColor = [UIColor ]
        
        animate()
        
        
        //
        let dataStoreController = DataStoreController.sharedInstance
        dataStoreController.inContext { context in
            guard let context = context else {
                print("Unable to load context:", dataStoreController.error)
                return
            }
            
            
            // Do stuff with context
            let playerFetch = NSFetchRequest(entityName: "Player")
            
            do {
                let fetchedPlayer = try context.executeFetchRequest(playerFetch) as! [Player]
                if(fetchedPlayer.first == nil){
                    print("NO PLAYER")
                }
                else{
                    print(fetchedPlayer.first?.name)
                    let petFetch = NSFetchRequest(entityName: "Pet")
                    let fetchedPet = try context.executeFetchRequest(petFetch) as! [Pet]
                    print("player is ")
                    print(fetchedPet.first?.player?.name)
                    self.petname.text = fetchedPet.first?.name
                    self.atk.text = fetchedPet.first?.attack?.stringValue
                    self.def.text = fetchedPet.first?.defense?.stringValue
                    self.hit.text = fetchedPet.first?.health?.stringValue
                    self.spd.text = fetchedPet.first?.speed?.stringValue
                    self.hpy.text = fetchedPet.first?.health?.stringValue
                    self.lvl.text = fetchedPet.first?.level?.stringValue
           

                }
            } catch {
                fatalError("Failed to fetch person: \(error)")
            }
            
        }
        //
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
