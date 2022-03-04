//
//  Koncentration.swift
//  Koncentration
//
//  Created by Ahmad Yasser on 05/03/2022.
//

import Foundation

class Koncentration {
    var cards =  [Card]()
    
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for identifier in 0..<numberOfPairsOfCards {
            let card = Card(identifier: identifier)
            cards += [card, card]
        }
        
    }
}

