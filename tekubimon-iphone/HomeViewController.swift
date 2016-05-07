//
//  HomeViewController.swift
//  tekubimon-iphone
//
//  Created by Kai on 5/2/16.
//  Copyright © 2016 William Shi. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        
        
        // Do any additional setup after loading the view.
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
                    let nextViewController = self.storyboard!.instantiateViewControllerWithIdentifier("FirstTimeViewController") as! FirstTimeViewController
                    self.presentViewController(nextViewController, animated:true, completion:nil)

                }
                else{
                    print(fetchedPlayer.first?.name)
                }
            } catch {
                fatalError("Failed to fetch person: \(error)")
            }
            super.viewDidLoad()
        }
        
        //Check for player entry in coreData
        
        
        

          //if it doesn't exist, direct to a new view to create one
        
        //else, display the current view with animation of last loaded tekubimon
        
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
    
    
    //Initialize/get core data stack
    //        let libraryDirectoryUrl = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask).first!
    //        let storeUrl = libraryDirectoryUrl.URLByAppendingPathComponent("Tekubimon.sqlite")
    //
    //        guard let modelUrl = NSBundle.mainBundle().URLForResource("PlayerModel", withExtension: "momd") else {
    //            fatalError("Error loading Core Data model")
    //        }
    
    //        let dataStoreController = DataStoreController(modelUrl: modelUrl, storeUrl: storeUrl)
    

    
    
    

}
