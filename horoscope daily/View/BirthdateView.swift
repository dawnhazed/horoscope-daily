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
    
    var body: some View {
        VStack {
            Text ("when's your birth day?")
            
            DatePicker("Enter your birthday", selection: $zodiacVM.date, displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
            .frame(maxHeight: 400)
            .padding()
        }
        .onAppear{
            zodiacVM.calculateZodiac()
        }
    }
}
