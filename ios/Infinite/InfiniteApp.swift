//
//  InfiniteApp.swift
//  Infinite
//
//  Created by Shaban on 19/08/2024.
//

import SwiftUI

@main
struct InfiniteApp: App {
    
    @State private var isActive = true
    
    var body: some Scene {
        WindowGroup {
            if BrandConfig.shared.showSplashScreen {
                splash
            } else {
                ContentView()
            }
        }
    }
    
    @ViewBuilder
    var splash: some View {
        if isActive {
            SplashScreen(isActive: $isActive)
        } else {
            ContentView()
        }
    }
}
