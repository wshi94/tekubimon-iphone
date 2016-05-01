//
//  HealthKitManager.swift
//  tekubimon
//
//  Created by Justin Cheng on 4/30/16.
//  Copyright © 2016 William Shi. All rights reserved.

// The ideas were taken from https://www.natashatherobot.com/healthkit-getting-fitness-data/
// Some code is copied and other lines are modified to contain what we need

import HealthKit

class HealthKitManager {
    
    class var sharedInstance: HealthKitManager {
        struct Singleton {
            static let instance = HealthKitManager()
        }
        
        return Singleton.instance
    }
    
    func authorizeHealthKit(completion: ((success:Bool, error:NSError!) -> Void)!){

        let healthStore: HKHealthStore? = {
            if HKHealthStore.isHealthDataAvailable() {
                return HKHealthStore()
            } else {
                return nil
            }
        }()
        let stepsCount = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)
        let dataTypesToWrite = NSSet(object: stepsCount!)
        let dataTypesToRead = NSSet(object: stepsCount!)
    
        healthStore!.requestAuthorizationToShareTypes(dataTypesToWrite as? Set<HKSampleType>, readTypes: dataTypesToRead as? Set<HKObjectType>) { (success, error) ->     Void in
            if( completion != nil ){
                completion(success:success,error:error)
            }
        }
    }
}
