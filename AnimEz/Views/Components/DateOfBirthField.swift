//
//  DateOfBirthField.swift
//  AnimEz
//
//  Created by Ryan Lauret on 22/07/2025.
//

import SwiftUI

struct DateOfBirthField: View {
    @Binding var date: Date?
    @State private var showPicker = false

    var formattedDate: String {
        if let date = date {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: date)
        } else {
            return "Date of birth"
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Button(action: {
                    withAnimation {
                        showPicker.toggle()
                    }
                }) {
                    Text(formattedDate)
                        .font(Font.custom("ReggaeOne-Regular", size: 16))
                        .foregroundColor(date == nil ? Color("BackgroundPink") : Color("PrimaryColor"))
                        .frame(width: 330, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    LinearGradient(
                                        colors: [Color("BackgroundPink"), Color("BackgroundBlue")],
                                        startPoint: .topLeading ,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 3
                                )
                                .blur(radius: 1)
                        )
                }

                // Clear button
                if date != nil {
                    Button(action: {
                        withAnimation {
                            date = nil
                            showPicker = false
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }

            // DatePicker shown conditionally
            if showPicker {
                DatePicker(
                    "",
                    selection: Binding(
                        get: { date ?? Date() },
                        set: { date = $0 }
                    ),
                    in: ...Date(),
                    displayedComponents: .date
                )
                .datePickerStyle(.wheel)
                .labelsHidden()
                .transition(.opacity)
                .onChange(of: date) {
                    withAnimation {
                        showPicker = false
                    }
                }
            }
        }
    }
}
