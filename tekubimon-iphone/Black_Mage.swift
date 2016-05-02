//
//  Black_Mage.swift
//  tekubimon-iphone
//
//  Created by William Shi on 5/1/16.
//  Copyright © 2016 William Shi. All rights reserved.
//

import Foundation

import SpriteKit

class Black_Mage{
    let bm0 = "black_mage_0"
    let bm1 = "black_mage_1"
    
    let textureAtlas = SKTextureAtlas(named: "Sprites")
    
    func move_1() -> SKTexture        { return textureAtlas.textureNamed(bm0) }
    func move_2() -> SKTexture        { return textureAtlas.textureNamed(bm1) }
    
    func move() -> [SKTexture]{
        return [
            move_1(),
            move_2()
        ]
    }
}