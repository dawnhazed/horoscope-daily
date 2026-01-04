//
//  MainView.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 03/01/26.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject private var viewModel: ZodiacViewModel
    
    init(zodiacVM: ZodiacViewModel) {
        self.viewModel = zodiacVM
    }
    
    var body: some View {
        TabView {
            HomeView(zodiacVM: viewModel)
                .tabItem {
                    Label("Starflow", systemImage: "moon.stars.circle.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
    }
}
