//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Damien Chailloleau on 12/08/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu - Swipe from the left edge to see it.")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    WelcomeView()
}
