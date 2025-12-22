//
//  HoroscopeViewModel.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 22/12/25.
//

import Combine
import SwiftUI
import ZodiacKit

@MainActor class HoroscopeViewModel: ObservableObject {
    
    @Published var horoscope: APIResponse?
    private let zodiacVM: ZodiacViewModel
    
    init(zodiacVM: ZodiacViewModel) {
        self.zodiacVM = zodiacVM
    }
    
    convenience init() {
        self.init(zodiacVM: ZodiacViewModel())
    }
    
    func fetchHoroscopeData(){
        let zodiac = zodiacVM.zodiacSign.name
        
        guard let url = URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=\(zodiac)&day=TODAY") else {
            print("Invalid URL")
            return
        }
        
        Task {
            do {
                let (data,_) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                
                let horoscopeData = try decoder.decode(APIResponse.self, from: data)
                
                self.horoscope = horoscopeData
                
                print("data received")
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
