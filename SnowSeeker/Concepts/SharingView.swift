//
//  SharingView.swift
//  SnowSeeker
//
//  Created by Damien Chailloleau on 12/08/2024.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player
    
    var body: some View {
        @Bindable var player = player
        
        Stepper("Your Score is : \(player.highScore)", value: $player.highScore)
    }
}

struct SharingView: View {
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            HighScoreView()
        }
        .environment(player)
    }
}


#Preview {
    SharingView()
}
