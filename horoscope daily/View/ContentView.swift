//
//  ContentView.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 22/12/25.
//

import SwiftUI
import Foundation
import SwiftData
import UserNotifications
import ZodiacKit

struct ContentView: View {
    
//    @StateObject private var viewModel: HoroscopeViewModel
    @ObservedObject private var viewModel: ZodiacViewModel
    
    init(zodiacVM: ZodiacViewModel) {
        self.viewModel = zodiacVM
    }
    
    var body: some View {
        VStack {
            Button ("Show Notification") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    
                    if granted {
                        let content = UNMutableNotificationContent()
                        content.title = "how's your day?"
                        content.body = "your daily horoscope is here. check it out!"
                        
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                    }
                }
            }
            .padding()
            
            Text("Hey, \(viewModel.zodiacSign.name)")
            
            if let horoscope = viewModel.horoscope {
                Text(String(describing: horoscope.data.horoscope_data))
                    .padding()
            }
        }
        .onAppear {
            viewModel.loadHoroscope()
        }
    }
}

//#Preview {
//    ContentView()
//        //.modelContainer(for: Item.self, inMemory: true)
//}
