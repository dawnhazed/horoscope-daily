//
//  ProfileView.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 03/01/26.
//

import SwiftUI
import Combine

struct ProfileView: View {
    
    @ObservedObject var profileVM: ProfileViewModel
    let profile: Profile?
    
    var body: some View {
        ZStack {
            LinearGradient(stops: [
                Gradient.Stop(color: .hdPink, location: 0.0),
                Gradient.Stop(color: .hdPurple, location: 0.32),
                Gradient.Stop(color: .hdViolet, location: 1.0)
            ], startPoint: .topTrailing, endPoint: .bottomLeading)
            
            if let birthdate = profile?.birthdate {
                Text("Birthdate: \(birthdate)")
            } else {
                Text("Birthdate: -")
            }
        }
        .ignoresSafeArea()
    }
}
