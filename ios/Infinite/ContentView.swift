//
//  ContentView.swift
//  Infinite
//
//  Created by Shaban on 19/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MyHomePage(title: "Infinite")
        }
        .accentColor(Color(BrandThemeColors.shared.primary))
        .background(Color(BrandThemeColors.shared.background))
    }
}

struct MyHomePage: View {
    let title: String
    @State private var counter = 0

    var body: some View {
        ZStack {
            Color(BrandThemeColors.shared.background).ignoresSafeArea()

            VStack(spacing: 16) {
                HeaderView()
                BrandInfoView()
                Spacer()

                VStack {
                    Text("You have pushed the button this many times:")
                        .foregroundColor(Color(BrandThemeColors.shared.onBackground))
                    Text("\(counter)")
                        .font(.headline)
                        .foregroundColor(Color(BrandThemeColors.shared.onBackground))
                }

                Spacer()
                FooterView(onIncrementClick: { counter += 1 })
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color(BrandThemeColors.shared.onPrimary))
            }
        }
        .navigationBarColor(backgroundColor: Color(BrandThemeColors.shared.primary), textColor: Color(BrandThemeColors.shared.onPrimary))
    }
}

struct HeaderView: View {
    var body: some View {
        Image("solara")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 200)
    }
}

struct BrandInfoView: View {
    let brandConfig = BrandConfig.shared

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            InfoText(title: "Bundle Identifier:", value: brandConfig.bundleIdentifier)
            InfoText(title: "Version Name:", value: brandConfig.marketingVersion)
            InfoText(title: "Build Number:", value: String(brandConfig.bundleVersion))
            InfoText(title: "baseUrl:", value: brandConfig.baseUrl)
            InfoText(title: "showSplashScreen:", value: String(brandConfig.showSplashScreen))
        }
    }
}

struct InfoText: View {
    let title: String
    let value: String

    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .foregroundColor(Color(BrandThemeColors.shared.primary))
                .font(.system(size: 18, weight: .bold))
            Text(value)
                .foregroundColor(Color(BrandThemeColors.shared.secondary))
                .font(.system(size: 16))
        }
    }
}

struct FooterView: View {
    let onIncrementClick: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Button(action: onIncrementClick) {
                Image(systemName: "plus")
                    .foregroundColor(Color(BrandThemeColors.shared.onPrimary))
                    .padding()
                    .background(Color(BrandThemeColors.shared.primary))
                    .clipShape(Circle())
            }
        }
    }
}

// Extensions and helper structs

extension View {
    func navigationBarColor(backgroundColor: Color, textColor: Color) -> some View {
        self.modifier(NavigationBarColorModifier(backgroundColor: backgroundColor, textColor: textColor))
    }
}

struct NavigationBarColorModifier: ViewModifier {
    var backgroundColor: Color
    var textColor: Color

    func body(content: Content) -> some View {
        content
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor(backgroundColor)
                appearance.titleTextAttributes = [.foregroundColor: UIColor(textColor)]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(textColor)]

                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
    }
}


#Preview {
    ContentView()
}
