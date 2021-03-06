//
//  Card.swift
//  Koncentration
//
//  Created by Ahmad Yasser on 05/03/2022.
//

import Foundation

struct Card {
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    private static var idFactory = 0
    
    private static func getUniqueId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init(identifier: Int) {
        self.identifier = Card.getUniqueId()
    }
}
