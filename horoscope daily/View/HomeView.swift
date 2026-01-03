//
//  HomeView.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 03/01/26.
//

import SwiftUI
import Foundation
import SwiftData
import UserNotifications
import ZodiacKit

struct HomeView: View {

    @ObservedObject private var viewModel: ZodiacViewModel
    @State private var isFlipped: Bool = false
    
    init(zodiacVM: ZodiacViewModel) {
        self.viewModel = zodiacVM
    }
    
    var body: some View {
        VStack {
            Text("Hey, \(viewModel.zodiacSign.name)!")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("We got your Starflow for today")
                .font(.title3)
                .fontWeight(.semibold)
            
            Image("cancer")
                .cornerRadius(20)
                .shadow(color: .white, radius: 20)
                .padding(.top, 30)
            
            if !isFlipped {
                Text("Flip to find out today’s horoscope")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.top, 30)
            } else {
                Text(" ")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.top, 30)
            }
        }
    }
}

#Preview {
    HomeView(zodiacVM: ZodiacViewModel())
}
