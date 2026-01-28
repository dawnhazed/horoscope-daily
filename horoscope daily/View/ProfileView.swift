//
//  ProfileView.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 03/01/26.
//

import SwiftUI
import Combine

struct ProfileView: View {
    
    @ObservedObject var profileVM: ProfileViewModel
    
    let profile: Profile?
    
    var body: some View {

        GeometryReader { geo in
            
            let center = CGPoint(
                x: geo.size.width / 2,
                y: geo.size.height / 2
            )
            
            ZStack {
                LinearGradient(stops: [
                    Gradient.Stop(color: .hdPink, location: 0.0),
                    Gradient.Stop(color: .hdPurple, location: 0.32),
                    Gradient.Stop(color: .hdViolet, location: 1.0)
                ], startPoint: .topTrailing, endPoint: .bottomLeading)
                
                Image("profile")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                ForEach(0..<5) { i in
                    
                    let widthheight: CGFloat = 100 + ((CGFloat(i) + 1) * 100)
                    let opacity: Double = 1.0 - (Double(i) * 0.2)
                    
                    Circle()
                        .stroke(Color.white, lineWidth: 1).opacity(opacity)
                        .frame(width: widthheight, height: widthheight)
                    
                    if i == 1 {
                        Circle()
                            .stroke(Color.white, lineWidth: 1).opacity(opacity)
                            .frame(width: widthheight, height: widthheight)
                    } else if i == 2 {
                        
                    }
                    
                }
                
                if let zodiac = profile?.zodiacEnum?.icon {
                    CircleItem(
                        circleColor: .white,
                        icon: zodiac,
                        radius: 150,
                        angle: 210,
                        diameter: 67                    )
                }
                
                if let birthdate = profile?.birthdate {
                    
                    CircleItem(
                        circleColor: .hdGreen,
                        textColor: .black,
                        text: "\(birthdate.day)/\(birthdate.month)",
                        radius: 200,
                        angle: 310,
                        diameter: 81
                    )
                    
                    CircleItem(
                        circleColor: .hdPink,
                        textColor: .white,
                        text: "'\(String(format: "%02d", birthdate.year % 100))",
                        radius: 150,
                        angle: 45,
                        diameter: 61
                    )
                }
                
                
//                if let birthdate = profile?.birthdate {
//                    Text("Birthdate: \(birthdate.day)")
//                } else {
//                    Text("Birthdate: -")
//                }
            }
            .ignoresSafeArea()
            .position(center)
        }
    }
}

