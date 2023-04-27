//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Matias Reyes on 4/21/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static var theme: CardTheme = .smileys
    static let emojis = theme.emojis().shuffled()
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 12) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    enum CardTheme {
        case vehicles
        case animals
        case smileys
        
        func emojis() -> [String] {
            switch self {
            case .vehicles:
                return ["🚌", "🚐", "🚒", "🏎️", "🚜", "🚝", "🛻", "🛵", "🛴", "🚤", "🛥️", "🚎", "🏍️", "🚙", "🚎"]
            case .animals:
                return ["🐶", "🐱", "🐭", "🦊", "🐰", "🐼", "🐻", "🐻‍❄️", "🐨", "🐯", "🦁", "🐷", "🐸", "🐵", "🐳", "🐠", "🐙"]
            case .smileys:
                return ["😀", "😅", "🥹", "😂", "😍", "😘", "🤪", "🤓", "🥳", "🤩", "🤬", "🥶", "😱", "👿", "👽", "💩", "🎃", "🤖", "🤠"]
            }
        }
    }
}

