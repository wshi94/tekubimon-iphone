//
//  BossInfo.swift
//  Test
//
//  Created by Kai on 5/14/16.
//  Copyright © 2016 Kai. All rights reserved.
//

import Foundation

class BossInfo: NSObject {
    
    override init(){
        super.init()
    }
    
    
    func getInfo(type: NSNumber, animation: String) ->Array<NSNumber>{
        
        switch type {
            
        //stump
        case 1:
            switch animation {
            case "attack":
                return[10,11,2,1]
            case "death":
                return[18,22,1]
            case "hit":
                return[14,15,1]
            case "move":
                return[0,4,1.5]
            case "stand":
                return[30,31,2]
            default:
                return[30,31,2]
            }
            
        //skeleton
        case 2:
            switch animation {
            case "attack":
                return[19,22,2,1]
            case "death":
                return[27,30,1]
            case "hit":
                return[15,15,1]
            case "move":
                return[7,10,2]
            case "stand":
                return[0,3,4]
            default:
                return[0,3,4]
            }
            
        //mushroom
        case 3:
            switch animation {
            case "attack":
                return[20,26,3,1.5]
            case "death":
                return[12,15,1.2]
            case "hit":
                return[7,7,1]
            case "move":
                return[4,6,2]
            case "stand":
                return[0,3,1.3]
            default:
                return[0,3,1.3]
            }
            
        //dragon
        case 4:
            switch animation {
            case "attack":
                return[200,218,2.5,1.5]
            case "death":
                return[81,85,2]
            case "hit":
                return[12,12,1]
            case "move":
                return[6,11,2]
            case "stand":
                return[101,106,1.5]
            default:
                return[101,106,1.5]
            }
            
            
        //balrog
        case 5:
            switch animation {
            case "attack":
                return[150,157,2.5,2]
            case "death":
                return[301,307,1.2]
            case "hit":
                return[298,298,1]
            case "move":
                return[10,14,2]
            case "stand":
                return[4,5,3]
            default:
                return[4,5,3]
            }
            
        //tree
        case 6:
            switch animation {
            case "attack":
                return[200,216,3,2]
            case "death":
                return[171,178,2]
            case "hit":
                return[167,167,1]
            case "move":
                return[12,18,4]
            case "stand":
                return[0,5,3]
            default:
                return[0,5,3]
            }
            
        default:
            return[0]
        }
        
    
    }
    
    
}