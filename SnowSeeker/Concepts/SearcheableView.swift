//
//  SearcheableView.swift
//  SnowSeeker
//
//  Created by Damien Chailloleau on 12/08/2024.
//

import SwiftUI

struct SearcheableView: View {
    
    @State private var searchText: String = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter { $0.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
}

#Preview {
    SearcheableView()
}
