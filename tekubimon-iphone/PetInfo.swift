//
//  PetInfo.swift
//  Test
//
//  Created by Kai on 5/14/16.
//  Copyright © 2016 Kai. All rights reserved.
//

import Foundation

class PetInfo: NSObject {
    
    override init(){
        super.init()
    }
    
    
    // return val is as follows:
    //[startframe, endframe, time]
    //for the attack animation:
    //[startframe, end frame, time, delay(before starting the boss's getting hit animation)]
    func getInfo(type: NSNumber, animation: String) ->Array<NSNumber>{
        
        switch type {
        
        //dragon
        case 1:
            switch animation {
            case "attack":
                return [77,86,3,1]
            case "death":
                return [97,104,3]
            case "hit":
                return [135,144,1]
            case "move":
                return [150,155,1]
            case "stand":
                return [0,27,7]
            default:
                return [0,27,7]
            }

            
        //lion
        case 2:
            switch animation {
            case "attack":
                return[101,118,3,1]
            case "death":
                return [33,36,2]
            case "hit":
                return [95,95,1.5]
            case "move":
                return [71,74,2]
            case "stand":
                return [0,11,4]
            default:
                return [0,11,3]
            }

            
        //porcupine
        case 3:
            switch animation {
            case "attack":
                return [65,88,2,1]
            case "death":
                return[200,202,2]
            case "hit":
                return[107,107,1.5]
            case "move":
                return[17,19,1]
            case "stand":
                return[0,15,3]
            default:
                return[0,15,3]
            }

            
        //yeti
        case 4:
            switch animation {
            case "attack":
                return[28,37,2,1]
            case "death":
                return[144,153,2]
            case "hit":
                return[140,143,1.5]
            case "move":
                return[1,4,1.5]
            case "stand":
                return[51,60,3]
            default:
                return[51,60,3]
            }
            
        default:
            return[0]
        }
        
        
    }
    
    
}