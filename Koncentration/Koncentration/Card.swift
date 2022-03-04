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
    
    func getUniqueId() -> UUID {
        return UUID()
    }
    
    init(identifier: Int) {
        self.identifier = identifier
    }
}
