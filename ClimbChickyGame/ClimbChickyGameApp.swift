//
//  ClimbChickyGameApp.swift
//  ClimbChickyGame
//
//  Created by alex on 3/7/25.
//

import SwiftUI

@main
struct ClimbChickyGameApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        let currentScreen = NavGuard.shared.currentScreen
        if currentScreen == .PLEASURE {
            return .allButUpsideDown
        } else {
            return .portrait
        }
    }
}
