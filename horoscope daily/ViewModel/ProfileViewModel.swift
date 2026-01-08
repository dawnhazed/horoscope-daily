//
//  ProfileViewModel.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 07/01/26.
//

import Combine
import Foundation
import SwiftUI
import ZodiacKit

class ProfileViewModel: ObservableObject {
    
    var zodiacVM: ZodiacViewModel
    let dataKey: String = "userData"
    
    @Published var userData: Profile
    @Published var isBirthdateDone: Bool
    
    init(zodiacVM: ZodiacViewModel, isBirthdateDone: Bool = false) {
        self.zodiacVM = zodiacVM
        
        if let data = UserDefaults.standard.data(forKey: dataKey),
           let savedProfile = try? JSONDecoder().decode(Profile.self, from: data) {
            
            // if there's data, use existing
            self.userData = savedProfile
            self.isBirthdateDone = savedProfile.isBirthdateDone
        } else {
            // if there's no data, use default
            self.isBirthdateDone = false
            self.userData = Profile(
                birthdate: zodiacVM.birthdate,
                zodiac: zodiacVM.zodiacSign.name,
                isBirthdateDone: false
            )
        }
    }
    
    func saveData() {
        self.isBirthdateDone = true
        
        self.userData = Profile(
            birthdate: zodiacVM.birthdate,
            zodiac: zodiacVM.zodiacSign.name,
            isBirthdateDone: true)
        
        if let encodeData = try? JSONEncoder().encode(userData) {
            UserDefaults.standard.set(encodeData, forKey: dataKey)
        }
        
        print("isBirthdateDone: \(isBirthdateDone)")
    }
}
