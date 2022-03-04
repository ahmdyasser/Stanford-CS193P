//
//  ViewController.swift
//  Koncentration
//
//  Created by Ahmad Yasser on 04/03/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    var game = Koncentration(numberOfPairsOfCards: 4)
    
    var flipCount = 0 {
        didSet {
            counterLabel.text = "Counter: \(flipCount)"
        }
    }
    let emojiChoices = ["🦷", "👃", "🦷", "👃",]
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("the card has no index")
        }
    }
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal)
        }
    }
}

