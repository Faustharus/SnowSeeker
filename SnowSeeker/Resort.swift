//
//  Resort.swift
//  SnowSeeker
//
//  Created by Damien Chailloleau on 12/08/2024.
//

import Foundation

struct Resort: Identifiable, Hashable, Codable {
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var size: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]
    
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
    
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example: Resort = allResorts[0]
}
