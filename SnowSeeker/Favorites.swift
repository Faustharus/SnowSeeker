//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Damien Chailloleau on 14/08/2024.
//

import SwiftUI

@Observable
class Favorites {
    private var resorts: Set<String>
    private let key: String = "Favorites"
    
    init() {
        if let saved = UserDefaults.standard.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: saved) {
                resorts = decoded
                return
            }
        }
        
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}
