//
//  FirebaseFeatureFlagsApp.swift
//  FirebaseFeatureFlags
//
//  Created by Silvia España Gil on 9/9/24.
//

import SwiftUI

@main

struct FirebaseFeatureFlagsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
                ContentView()
        }
    }
}
