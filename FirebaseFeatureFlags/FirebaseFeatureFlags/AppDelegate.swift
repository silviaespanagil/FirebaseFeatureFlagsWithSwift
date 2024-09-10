//
//  AppDelegate.swift
//  FirebaseFeatureFlags
//
//  Created by Silvia España Gil on 10/9/24.
//

import Foundation
import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
    FirebaseApp.configure()
      
    return true
  }
}
