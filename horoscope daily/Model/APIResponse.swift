//
//  APIResponse.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 22/12/25.
//

import SwiftUI

struct APIResponse: Codable, Hashable {
    let data: Horoscope
    let status: Int
    let success: Bool
}
