import SwiftUI

struct AttendanceView: View {
    @State private var hasCalculated = false
    @Binding var manager: AttendanceManager

    var body: some View {
        VStack {
            Text("Attendance!")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 10)

            Text(getCalculationStatus())
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.bottom, 10)

            Button(action: {
                if manager.getCount() > 0 {
                    hasCalculated = true
                }
            }) {
                Text("Calculate Attendance!")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom, 10)

            Divider()
                .padding(.vertical, 10)

            if hasCalculated && manager.getCount() > 0 {
                List(getAttendanceSummary(), id: \.self) { summary in
                    Text(summary)
                }
                .listStyle(PlainListStyle())
            }

            Spacer()
        }
        .padding()
    }

    func getCalculationStatus() -> String {
        if manager.getCount() == 0 {
            return "No Attendance to Show!"
        } else if !hasCalculated {
            return "Please click Calculate Attendance"
        } else {
            return "Your Attendance:"
        }
    }

    func getAttendanceSummary() -> [String] {
        var summary: [String: Int] = [:]

 
        return summary.map { subject, minutes in
            "\(subject): \(minutes) minutes"
        }
    }
}

struct AttendanceView_Previews: PreviewProvider {
    @State static var manager = AttendanceManager() // Preloaded AttendanceManager for preview
    static var previews: some View {
        AttendanceView(manager: $manager)
    }
}
