import SwiftUI

struct DateOfBirthField: View {
    @Binding var date: Date
    @Binding var animate: Bool
    @State private var showPicker: Bool = false

    // Formatter for display
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    var body: some View {
        VStack(spacing: 10) {
            // Tap field
            Button(action: {
                withAnimation {
                    showPicker.toggle()
                }
            }) {
                Text(formattedDate)
                    .font(Font.custom("ReggaeOne-Regular", size: 16))
                    .foregroundColor(Color("PrimaryColor"))
                    .frame(width: 330, height: 50)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(
                                LinearGradient(
                                    colors: [Color("BackgroundPink"), Color("BackgroundBlue")],
                                    startPoint: animate ? .topLeading : .bottomTrailing,
                                    endPoint: animate ? .bottomTrailing : .topLeading
                                ),
                                lineWidth: 3
                            )
                            .animation(.linear(duration: 3).repeatForever(autoreverses: true), value: animate)
                    )
            }

            // Date picker (appears only when showPicker is true)
            if showPicker {
                DatePicker(
                    "",
                    selection: $date,
                    in: ...Date(),
                    displayedComponents: .date
                )
                .datePickerStyle(.wheel)
                .labelsHidden()
                .transition(.opacity)
                .onChange(of: date) { _ in
                    withAnimation {
                        showPicker = false
                    }
                }
            }
        }
    }
}