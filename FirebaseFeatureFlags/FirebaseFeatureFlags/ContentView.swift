//
//  ContentView.swift
//  FirebaseFeatureFlags
//
//  Created by Silvia España Gil on 9/9/24.
//

import SwiftUI
import FirebaseRemoteConfig

struct ContentView: View {
    
    @State private var isBlueBackgroundEnabled = false
    
    var body: some View {
        
        ZStack {
            
            (isBlueBackgroundEnabled ? Color.blue.opacity(0.5) : Color.pink.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                
                Text("Hello, Feature Flags!")
                    .font(.title)
                    .foregroundColor(isBlueBackgroundEnabled ? .white : .black)
                
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundColor(isBlueBackgroundEnabled ? .white : .black)
                    .onTapGesture {
                        fetchRemoteConfig()
                    }
            }
        }
        .onAppear {
            fetchRemoteConfig()
        }
    }
}

extension ContentView {
    
    
    private func configureRemoteConfig(_ remoteConfig: RemoteConfig) {
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(["isBlueBackgroundEnabled": NSNumber(value: false)])
    }
    
    private func fetchRemoteConfig() {
        
        let remoteConfig = RemoteConfig.remoteConfig()
        configureRemoteConfig(remoteConfig)
        
        remoteConfig.fetch { status, error in
            
            if status == .success {
                
                remoteConfig.activate { _, _ in
                    self.isBlueBackgroundEnabled = remoteConfig["isBlueBackgroundEnabled"].boolValue
                }
            } else {
                
                print("Error fetching remote config: \(String(describing: error))")
            }
        }
    }
}

#Preview {
    ContentView()
}
