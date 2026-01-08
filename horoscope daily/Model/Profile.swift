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
}
