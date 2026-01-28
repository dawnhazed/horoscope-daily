//
//  Profile.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 06/01/26.
//

import SwiftUI
import SwiftData

struct Profile: Codable, Hashable {
    let birthdate: Birthdate
    let zodiac: String
    let isBirthdateDone: Bool
    
    var zodiacEnum: Zodiac? {
        Zodiac(rawValue: zodiac.lowercased())
    }
}

enum Zodiac: String, Codable, CaseIterable {
    case capricorn, aquarius, aries, pisces, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius
    
    var icon : String {
        switch self {
            case .capricorn: return "♑️"
            case .aquarius: return "♒️"
            case .aries: return "♈️"
            case .pisces : return "♓️"
            case .taurus: return "♉️"
            case .gemini: return "♊️"
            case .cancer: return "♋️"
            case .leo: return "♌️"
            case .virgo: return "♍️"
            case .libra: return "♎️"
            case .scorpio: return "♏️"
            case .sagittarius: return "♐️"
        }
    }
}
