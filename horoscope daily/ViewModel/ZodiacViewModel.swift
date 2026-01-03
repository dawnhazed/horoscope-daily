//
//  ZodiacViewModel.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 23/12/25.
//

import Combine
import SwiftUI
import ZodiacKit

@MainActor
class ZodiacViewModel: ObservableObject {
    
    @Published var date: Date = Date()
    @Published var horoscope: APIResponse?
    @Published var zodiacSign: Western = .taurus
    
    private let zodiacService = ZodiacService()
    
    var birthdate: Birthdate {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        return Birthdate(
            year: components.year ?? 0,
            month: components.month ?? 0,
            day: components.day ?? 0
        )
    }
    
    func calculateZodiac() async {
        do {
            let dateComponents = DateComponents(year: birthdate.year, month: birthdate.month, day: birthdate.day)
            guard let birthDate = Calendar.current.date(from: dateComponents) else {
                print("Failed to build birth date from components")
                return
            }
            self.zodiacSign = try zodiacService.getWesternZodiac(from: birthDate)
            
            print("your zodiac is : \(birthdate.year)-\(birthdate.month)-\(birthdate.day) -> \(self.zodiacSign.name)")
            print("zodiac sign rn : \(self.zodiacSign)")
        } catch {
            print("Failed to get zodiac sign: \(error.localizedDescription)")
        }
        
    }
    
    func fetchHoroscopeData() async {
        let zodiac = self.zodiacSign.name
        print("fetched for \(zodiac)")
        
        guard let url = URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=\(zodiac)&day=TODAY") else {
            print("Invalid URL")
            return
        }
        
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
    
    func loadHoroscope() {
        Task {
            await calculateZodiac()
            await fetchHoroscopeData()
        }
    }
}
