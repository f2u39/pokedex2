//
//  Pokemon.swift
//  pokedex
//
//  Created by Fuu on 2022/09/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Pokemon: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var jp_name: String
    var description: String
    
    var image: Image {
        Image(id)
    }
}
