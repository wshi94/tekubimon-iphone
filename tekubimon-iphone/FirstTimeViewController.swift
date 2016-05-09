//
//  FirstTimeViewController.swift
//  tekubimon-iphone
//
//  Created by Kai on 5/6/16.
//  Copyright © 2016 William Shi. All rights reserved.
//
import Foundation
import UIKit
import CoreData

class FirstTimeViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var playerNameText: UITextField!
    @IBAction func nextButton(sender: AnyObject) {
        print(playerNameText.text)
        let dataController = DataStoreController.sharedInstance
        
        let moc = dataController.managedObjectContext
        let playerEntity = NSEntityDescription.insertNewObjectForEntityForName("Player", inManagedObjectContext: moc!) as! Player
        
        let petEntity = NSEntityDescription.insertNewObjectForEntityForName("Pet", inManagedObjectContext: moc!) as! Pet
        petEntity.setValue("genius" , forKey: "name")
        petEntity.setValue(playerEntity, forKey: "player")
        petEntity.setValue(1, forKey: "attack")
        petEntity.setValue(2, forKey: "defense")
        petEntity.setValue(10, forKey: "health")
        petEntity.setValue(1, forKey: "level")
        petEntity.setValue("ace ventura", forKey: "name")
        petEntity.setValue(10, forKey: "speed")
        playerEntity.setValue(playerNameText.text, forKey: "name")
        do {
            try moc!.save()
            let nextViewController = self.storyboard!.instantiateViewControllerWithIdentifier("Home") as! HomeTabViewController
            self.presentViewController(nextViewController, animated:true, completion:nil)
            
        } catch {
            fatalError("oh boy: \(error)")
        }
        
        
        
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
