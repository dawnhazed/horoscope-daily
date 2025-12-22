//
//  Item.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 22/12/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
