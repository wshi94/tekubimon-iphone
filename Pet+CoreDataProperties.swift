//
//  Pet+CoreDataProperties.swift
//  tekubimon-iphone
//
//  Created by Kai on 5/9/16.
//  Copyright © 2016 William Shi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Pet {

    @NSManaged var attack: NSNumber?
    @NSManaged var defense: NSNumber?
    @NSManaged var health: NSNumber?
    @NSManaged var level: NSNumber?
    @NSManaged var name: String?
    @NSManaged var speed: NSNumber?
    @NSManaged var player: Player?

}
