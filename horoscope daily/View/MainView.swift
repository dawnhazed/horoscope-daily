//
//  MainView.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 03/01/26.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject private var viewModel: ZodiacViewModel
    @ObservedObject private var profileVM: ProfileViewModel
    
    
    init(zodiacVM: ZodiacViewModel, profileVM: ProfileViewModel) {
        self.viewModel = zodiacVM
        self.profileVM = profileVM
    }
    
    var body: some View {
        TabView {
            HomeView(zodiacVM: viewModel)
                .tabItem {
                    Label("Starflow", systemImage: "moon.stars.circle.fill")
                }
            
            ProfileView(profileVM: profileVM, profile: profileVM.userData)
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
    }
}
