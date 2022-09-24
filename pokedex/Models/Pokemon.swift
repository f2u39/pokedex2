//
//  Pokemon.swift
//  pokedex
//
//  Created by Fuu on 2022/09/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Type: Codable {
    var name: String
}

struct Pokemon: Codable, Identifiable {
    var id: String
    var name: String
    var jp_name: String
    var types: [Type]
    var description: String
}
