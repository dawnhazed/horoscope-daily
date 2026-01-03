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
        ZStack {
            LinearGradient(stops: [
                Gradient.Stop(color: .hdPink, location: 0.0),
                Gradient.Stop(color: .hdPurple, location: 0.32),
                Gradient.Stop(color: .hdViolet, location: 1.0)
            ], startPoint: .topTrailing, endPoint: .bottomLeading)
            
            VStack {
                Text("Hey, \(viewModel.zodiacSign.name)!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.hdGreen)
                
                Text("We got your Starflow for today")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                ZStack {
                    if isFlipped {
                        BackCardView(viewModel: viewModel)
                            .rotation3DEffect(.degrees(-180), axis: (x:0, y: 1, z: 0))
                    } else {
                        FrontCardView()
                    }
                }
                .rotation3DEffect(.degrees(isFlipped ? -180 : 0), axis: (x:0, y: 1, z: 0))
                .animation(.easeInOut, value: isFlipped)
                .onTapGesture {
                    isFlipped.toggle()
                }
                
                if !isFlipped {
                    Text("Flip to find out today’s horoscope")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.top, 30)
                        .foregroundStyle(.white)
                } else {
                    Text(" ")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(.top, 30)
                }
            }
            .padding(.bottom, 20)
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.loadHoroscope()
        }
    }
}

struct FrontCardView: View {
    var body: some View {
        Image("cancer")
            .cornerRadius(20)
            .shadow(color: .white, radius: 20)
            .padding(.top, 30)
    }
}

struct BackCardView: View {
    
    @ObservedObject var viewModel: ZodiacViewModel
    
    var body: some View {
        ZStack {
            Color.hdGreen
            
            if let horoscope = viewModel.horoscope {
                Text(String(describing: horoscope.data.horoscope_data))
                    .padding(27)
                    .foregroundStyle(.hdText)
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: 284, height: 485)
        .cornerRadius(20)
        .shadow(color: .white, radius: 20)
        .padding(.top, 30)
    }
}

#Preview {
    HomeView(zodiacVM: ZodiacViewModel())
}
