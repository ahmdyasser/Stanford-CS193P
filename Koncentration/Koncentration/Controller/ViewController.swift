//
//  ViewController.swift
//  Koncentration
//
//  Created by Ahmad Yasser on 04/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    lazy var game = Koncentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2 )
    
    var flipCount = 0 {
        didSet {
            counterLabel.text = "Counter: \(flipCount)"
        }
    }
    
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("the card has no index")
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
    
    var emojiChoices = ["🦷", "👃", "📹", "🖥","🥺","🎩","🪢","🥾","👑","🧵", "🪡", "🪖"]
    var emoji: [Int:String] = [:]
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

