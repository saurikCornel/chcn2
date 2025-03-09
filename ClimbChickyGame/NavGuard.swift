//
//  NavGuard.swift
//  ClimbChickyGame
//
//  Created by alex on 3/7/25.
//

import Foundation

enum AvailableScreens {
    case GAME
    case LOADING
    case PLEASURE
    
}

class NavGuard: ObservableObject {
    @Published var currentScreen: AvailableScreens = .LOADING
    static var shared: NavGuard = .init()
}
