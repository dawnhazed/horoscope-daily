//
//  HoroscopeViewModel.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 22/12/25.
//

import Combine
import SwiftUI

class HoroscopeViewModel: ObservableObject{
    
    @Published var horoscope: APIResponse?
    let zodiac: String = ""
    
    func fetchHoroscopeData(){
        guard let url = URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=Cancer&day=TODAY") else {
            print("Invalid URL")
            return
        }
        
        Task {
            do {
                let (data,_) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                
                let horoscopeData = try decoder.decode(APIResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.horoscope = horoscopeData
                }
                
                print("data received")
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
