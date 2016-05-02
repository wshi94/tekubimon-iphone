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
    
    let healthStore: HKHealthStore? = {
        if HKHealthStore.isHealthDataAvailable() {
            return HKHealthStore()
        } else {
            return nil
        }
    }()
    let stepsCount = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)
    var steps = [HKQuantitySample]()
    
    //init(){
        
    //}
    
    class var sharedInstance: HealthKitManager {
        struct Singleton {
            static let instance = HealthKitManager()
        }
        
        return Singleton.instance
    }
    
    func authorizeHealthKit(completion: ((success:Bool, error:NSError!) -> Void)!){
        
        let dataTypesToWrite = NSSet(object: stepsCount!)
        let dataTypesToRead = NSSet(object: stepsCount!)
        
        //print(stepsCount)
    
        healthStore!.requestAuthorizationToShareTypes(dataTypesToWrite as? Set<HKSampleType>, readTypes: dataTypesToRead as? Set<HKObjectType>) { (success, error) ->     Void in
            if( completion != nil ){
                completion(success:success,error:error)
            }
        }
    }
    
    func getSteps(){
        let stepsQuery = HKSampleQuery(sampleType: stepsCount!,
                                             predicate: nil,
                                             limit: 100,
                                             sortDescriptors: nil)
        { [unowned self] (query, results, error) in
            if let results = results as? [HKQuantitySample] {
                self.steps = results
                //self.tableView.reloadData()
            }
            //self.activityIndicator.stopAnimating()
        }
        
        healthStore?.executeQuery(stepsQuery)
    }
    
    func test(completion: (Double, NSError?) -> ()){
        // The type of data we are requesting (this is redundant and could probably be an enumeration
        let type = HKSampleType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "MMM dd, yyyy zzz"
        var dateAsString1 = "May 01, 2016 GMT"
        var date1 = dateFormatter.dateFromString(dateAsString1)!
        var dateAsString2 = "Apr 30, 2016 GMT"
        var date2 = dateFormatter.dateFromString(dateAsString2)!

        
        // Our search predicate which will fetch data from now until a day ago
        // (Note, 1.day comes from an extension
        // You'll want to change that to your own NSDate
        let predicate = HKQuery.predicateForSamplesWithStartDate(date1, endDate: date2, options: .None)
        
        // The actual HealthKit Query which will fetch all of the steps and sub them up for us.
        let query = HKSampleQuery(sampleType: type!, predicate: predicate, limit: 0, sortDescriptors: nil) { query, results, error in
            var steps: Double = 0
            
            if results?.count > 0
            {
                for result in results as! [HKQuantitySample]
                {
                    steps += result.quantity.doubleValueForUnit(HKUnit.countUnit())
                }
            }
            
            completion(steps, error)
        }
        
        healthStore!.executeQuery(query)
    }
}
