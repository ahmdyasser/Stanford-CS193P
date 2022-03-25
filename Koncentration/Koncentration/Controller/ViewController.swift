//
//  ViewController.swift
//  Koncentration
//
//  Created by Ahmad Yasser on 04/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet  private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("the card has no index")
        }
    }
    
    private lazy var game = Koncentration(numberOfPairsOfCards: numberOfPairOfCards)
    
    var numberOfPairOfCards: Int {
        return  (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            counterLabel.text = "Counter: \(flipCount)"
        }
    }
    
    
    
    
   
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFacedUp {
                button.backgroundColor = .white
                button.setTitle(emoji(for: card), for: .normal)
                
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    private var emojiChoices = ["🦷", "👃", "📹", "🖥","🥺","🎩","🪢","🥾","👑","🧵", "🪡", "🪖"]
    private var emoji: [Int:String] = [:]
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return  Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
           return -Int(arc4random_uniform(UInt32(self)))
        }
        return 0
    }
}
