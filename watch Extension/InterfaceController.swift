//
//  InterfaceController.swift
//  watch Extension
//
//  Created by William Shi on 5/13/16.
//  Copyright © 2016 William Shi. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController {
    @IBOutlet var image: WKInterfaceImage!

    func animate(){
        self.image.setImageNamed("black_mage")
        self.image.startAnimatingWithImagesInRange(NSMakeRange(0, 2), duration: 1.0, repeatCount: -1)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Do the animation here
        animate()
        
        var session: WCSession? {
            didSet {
                if let session = session {
                    session.delegate = self
                    session.activateSession()
                }
            }
        }
    }
    
    // This should be where we send a request to the iPhone and receive a message back
    override func didAppear() {
        super.didAppear()
        
        if WCSession.isSupported(){
            //session = WCSession.defaultSession()
            //session!.sendMessage()//
        }
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

extension InterfaceController: WCSessionDelegate {
    
}
