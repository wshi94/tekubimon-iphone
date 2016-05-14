//
//  AppDelegate.swift
//  tekubimon-iphone
//
//  Created by William Shi on 5/1/16.
//  Copyright © 2016 William Shi. All rights reserved.
//

import UIKit
import CoreData
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let healthManager: HealthKitManager = HealthKitManager()
    
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
    }
    

//    let dataStoreController = DataStoreController(modelUrl: NSBundle.mainBundle().URLForResource("PlayerModel", withExtension: "momd")!, storeUrl: NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask).first!.URLByAppendingPathComponent("Tekubimon.sqlite"))
//    
    
    func save(){
        
    }
    
    
  
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        authorizeHealthKit()
        //healthManager.getSteps()
        healthManager.test(){ steps, error in
            print(steps)
        }
        print(healthManager.steps)
        //hkm.authorizeHealthKit(<#T##completion: ((success: Bool, error: NSError!) -> Void)!##((success: Bool, error: NSError!) -> Void)!##(success: Bool, error: NSError!) -> Void#>)
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        save()
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        save()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        save();
    }

   

}

