//
//  NavigationAttributes.swift
//  pokedex
//
//  Created by Fuu on 2022/09/23.
//

import SwiftUI
import ActivityKit

struct WorkoutAttributes: ActivityAttributes {
    
    struct ContentState: Codable,Hashable{
        var status: Status = .stop
        var progress: Float = 0.6
    }

    
    var workoutName: String
    
}

enum Status : String, CaseIterable, Codable, Equatable{
    case stop = "pause"
    case resume = "play"
    
    var caption: String{
        switch(self){
            case .stop:
                return "pause"
            case .resume:
                return "play"
        }
    }
}
