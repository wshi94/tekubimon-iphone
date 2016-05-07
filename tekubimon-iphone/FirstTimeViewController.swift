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
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Player", inManagedObjectContext: moc!) as! Player
        
        entity.setValue("test", forKey: "name")
        do {
            try moc!.save()
            let nextViewController = self.storyboard!.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
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
