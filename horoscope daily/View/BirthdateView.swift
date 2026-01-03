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
            VStack {
                Text ("when's your birth day?")
                
                DatePicker("Enter your birthday", selection: $zodiacVM.date, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(maxHeight: 400)
                    .padding()
                
                Button {
                    isBirthdateDone = true
                } label: {
                    Text("Get your horoscope")
                        .foregroundColor(.white)
                        .font(.callout)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                .navigationDestination(isPresented: $isBirthdateDone) {
                    ContentView(zodiacVM: zodiacVM)
                }
            }
        }
    }
}

