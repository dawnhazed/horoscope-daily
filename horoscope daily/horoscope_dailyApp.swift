//
//  horoscope_dailyApp.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 22/12/25.
//

import SwiftUI
import SwiftData

@main
struct horoscope_dailyApp: App {
    
    @StateObject private var zodiacVM = ZodiacViewModel()
    @StateObject private var profileVM: ProfileViewModel

    init() {
        let zVM = ZodiacViewModel()
        _zodiacVM = StateObject(wrappedValue: zVM)
        _profileVM = StateObject(wrappedValue: ProfileViewModel(zodiacVM: zVM))
    }
    
    var body: some Scene {
        WindowGroup {
            if profileVM.isBirthdateDone {
                MainView(zodiacVM: ZodiacViewModel(), profileVM: ProfileViewModel(zodiacVM: ZodiacViewModel()))
            } else {
                BirthdateView()
            }
        }
//        .modelContainer(sharedModelContainer)
    }
}
