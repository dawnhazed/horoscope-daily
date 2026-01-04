//
//  BirthdateView.swift
//  horoscope daily
//
//  Created by Nadaa Shafa Nadhifa on 23/12/25.
//

import SwiftUI

struct BirthdateView: View {
    @State var date = Date()
    @StateObject private var zodiacVM = ZodiacViewModel()
    @State var isBirthdateDone: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(stops: [
                    Gradient.Stop(color: .hdPink, location: 0.0),
                    Gradient.Stop(color: .hdPurple, location: 0.32),
                    Gradient.Stop(color: .hdViolet, location: 1.0)
                ], startPoint: .topTrailing, endPoint: .bottomLeading)
                
                VStack {
                    Text ("Tell us your birthday")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundStyle(.hdGreen)
                    
                    Text ("This will help us to know your birth sign \nfor your daily horoscopes")
                        .font(.callout)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 32)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxHeight: 355)
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                        
                        DatePicker("Enter your birthday", selection: $zodiacVM.date, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .frame(maxWidth: 400)
                            .padding(.horizontal, 40)
                    }
                        
                    Button {
                        isBirthdateDone = true
                    } label: {
                        Text("Discover your Starflow")
                            .foregroundColor(.white)
                            .font(.callout)
                            .fontWeight(.bold)
                            .padding()
                    }
                    .glassEffect(.regular.tint(.hdGreen.opacity(0.7)), in: Capsule())
                    .padding(.top, 32)
                    .navigationDestination(isPresented: $isBirthdateDone) {
                        MainView(zodiacVM: zodiacVM)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    BirthdateView()
}

