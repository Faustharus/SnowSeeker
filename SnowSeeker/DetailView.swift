//
//  DetailView.swift
//  SnowSeeker
//
//  Created by Damien Chailloleau on 12/08/2024.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(Favorites.self) var favorites
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility: Bool = false
    
    let resort: Resort
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    if horizontalSizeClass == .compact && dynamicTypeSize > .large {
                        VStack(spacing: 10) { SkiDetailsView(resort: resort) }
                        VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                    } else {
                        SkiDetailsView(resort: resort)
                        ResortDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 1)
                        .frame(height: 30)
                    VStack {
                        Text("Image of : \(Text(resort.imageCredit).bold())")
                            .foregroundStyle(.white)
                    }
                }
                .padding(.vertical, 2)
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    // MARK: Old Display of facilities
//                    Text(resort.facilities, format: .list(type: .and))
//                        .padding(.vertical)
                    
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            Button {
                                selectedFacility = facility
                                showingFacility = true
                            } label: {
                                facility.icon
                                    .font(.title)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
            }
            
            Button(favorites.contains(resort) ? "Remove from favorites" : "Add to favorites") {
                if favorites.contains(resort) {
                    favorites.remove(resort)
                } else {
                    favorites.add(resort)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacility) { _ in
        } message: { facility in
            Text(facility.description)
        }
    }
}

#Preview {
    DetailView(resort: .example)
        .environment(Favorites())
}
