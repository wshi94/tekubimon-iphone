//
//  StatViewController.swift
//  tekubimon-iphone
//
//  Created by William Shi on 5/2/16.
//  Copyright © 2016 William Shi. All rights reserved.
//

import Foundation
import SpriteKit

class StatViewController: UIViewController {
    
    var bmArray:[UIImage] = []
    var attack = 10
    var defense = 10
    
    
    @IBOutlet weak var atk: UILabel!
    @IBOutlet weak var pnta: UILabel!
    
    @IBAction func attackUp(sender: AnyObject) {
        attack += 1
        atk.text = "\(attack)"
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
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
        
        pnta.text = "2"
        
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