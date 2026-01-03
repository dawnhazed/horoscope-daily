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
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Horoscope.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
    var isBirthdateDone : Bool = false
    var body: some Scene {
        WindowGroup {
            if isBirthdateDone {
//                ContentView()
            } else {
                MainView()
            }
        }
//        .modelContainer(sharedModelContainer)
    }
}
