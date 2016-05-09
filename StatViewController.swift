//
//  GameViewController.swift
//  tekubimon-iphone
//
//  Created by William Shi on 5/1/16.
//  Copyright (c) 2016 William Shi. All rights reserved.
//

import UIKit
import SpriteKit

class StatViewController: UIViewController {
    
    var bmArray:[UIImage] = []
    

    @IBOutlet weak var imageView: UIImageView!

    
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
