//
//  memorizeApp.swift
//  memorize
//
//  Created by Matias Reyes on 4/12/23.
//

import SwiftUI

@main
struct memorizeApp: App {
    let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
