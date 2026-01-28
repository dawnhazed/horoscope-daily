//
//  CircleItem.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 28/01/26.
//

import SwiftUI

struct CircleItem: View {
    
    var circleColor: Color
    var textColor: Color?
    
    var icon: String?
    var text: String?
    
    var radius: CGFloat
    var angle: Double
    var diameter: Double
    
    var body: some View {
        
        let x = radius * cos(angle * .pi / 180)
        let y = radius * sin(angle * .pi / 180)
        
        Circle()
            .fill(circleColor)
            .frame(width: diameter, height: diameter)
            .overlay(
                Group {
                    if let icon = icon {
                        Text(icon)
                            .font(.largeTitle)
                            
                    } else if let text = text {
                        if let textColor = textColor {
                            Text(text)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(textColor)
//                                .multilineTextAlignment(.leading)
//                                .lineLimit(2)
//                                .lineSpacing(-50.0)
                                .fixedSize()
                        }
                    }
                }
            )
            .offset(x: x, y: y)
    }
}
