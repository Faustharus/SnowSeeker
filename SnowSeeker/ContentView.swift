//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Damien Chailloleau on 09/08/2024.
//

import SwiftUI

enum SortingOrder: String, CaseIterable {
    case regular, alphabetic, country
}

struct ContentView: View {
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var favorites = Favorites()
    @State private var searchText: String = ""
    
    @State private var sorting: SortingOrder = .regular
    @State private var showingSortOptions: Bool = false
    
    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                DetailView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Button {
                    self.showingSortOptions = true
                } label: {
                    Label("Change sort order", systemImage: "arrow.up.arrow.down")
                }
            }
            .confirmationDialog("Sorting Choices", isPresented: $showingSortOptions) {
                Button("Default") { sorting = .regular }
                Button("Alphabetic") { sorting = .alphabetic }
                Button("Country") { sorting = .country }
            }
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            resorts
        } else {
            resorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    var sortedResorts: [Resort] {
        switch sorting {
        case .regular:
            return resorts.sorted { first, second in
                first.id < second.id
            }
        case .alphabetic:
            return resorts.sorted { first, second in
                first.name < second.name
            }
        case .country:
            return resorts.sorted { first, second in
                first.country < second.country
            }
        }
    }
    
}
