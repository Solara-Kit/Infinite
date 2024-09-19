//
//  ContentView.swift
//  Infinite
//
//  Created by Shaban on 19/08/2024.
//

import SwiftUI

struct SplashScreen: View {
    @Binding var isActive: Bool

    var body: some View {
        VStack {
            Image("solara")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("Welcome to Infinite")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
        .background(Color.white)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    isActive = false
                }
            }
        }
    }
}
