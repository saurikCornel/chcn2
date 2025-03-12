//
//  NavGuard.swift
//  ClimbChickyGame
//
//  Created by alex on 3/7/25.
//

import Foundation

enum AvailableScreens {
    case CLIMBGAME
    case RUNCHICKYGAME
    case COCOPUZZLEGAME
    
    
    case LOADING
    case PLEASURE
    case MENU
    
}

class NavGuard: ObservableObject {
    @Published var currentScreen: AvailableScreens = .LOADING
    static var shared: NavGuard = .init()
}
