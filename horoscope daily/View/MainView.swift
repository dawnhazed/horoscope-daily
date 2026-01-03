//
//  MainView.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 03/01/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView(zodiacVM: ZodiacViewModel())
                .tabItem {
                    Label("Starflow", systemImage: "moon.stars.circle.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
        .background()
    }
}
