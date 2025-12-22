//
//  ZodiacViewModel.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 23/12/25.
//

import Combine
import SwiftUI
import ZodiacKit

class ZodiacViewModel: ObservableObject {
    @Published var date = Date()
    private let zodiacService = ZodiacService()
    var zodiacSign: Western = .aries
    
    var birthdate: Birthdate {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        return Birthdate(
            year: components.year ?? 0,
            month: components.month ?? 0,
            day: components.day ?? 0
        )
    }
    
    func calculateZodiac() {
        Task {
            do {
                let dateComponents = DateComponents(year: birthdate.year, month: birthdate.month, day: birthdate.day)
                guard let birthDate = Calendar.current.date(from: dateComponents) else {
                    print("Failed to build birth date from components")
                    return
                }
                self.zodiacSign = try zodiacService.getWesternZodiac(from: birthDate)
                print("your zodiac is : \(birthdate.year)-\(birthdate.month)-\(birthdate.day) -> \(self.zodiacSign.name)")
            } catch {
                print("Failed to get zodiac sign: \(error.localizedDescription)")
            }
        }
    }
}
