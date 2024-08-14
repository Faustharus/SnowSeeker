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
    private var key: String = "Favorites"
    
    init() {
        // MARK: Load function
        
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
        if let data = UserDefaults.standard.string(forKey: key) {
            try? data.write(to: <#T##URL#>, atomically: <#T##Bool#>, encoding: <#T##String.Encoding#>)
        }
    }
}
