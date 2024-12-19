import SwiftUI

struct DetailView: View {
    var result: Attendance

    var body: some View {
        VStack(spacing: 20) {
            // TASK A: Define Two Text Elements
            Text("Subject: \(result.subject)")
                .font(.title)
                .bold()
            
            Text("Minutes: \(result.minutes)")
                .font(.headline)
            
            // TASK B: Show the contribution
            Text("Attendance Contribution: \(calculateContribution())%")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Spacer()
        }
        .padding()
        .navigationTitle("Detail View")
    }

    func calculateContribution() -> Double {
        let totalMinutes = 2340.0
        let contribution = (Double(result.minutes) / totalMinutes) * 100
        return round(contribution * 10) / 10.0
    }
}

struct DetailView_Preview: PreviewProvider {
    @State static var result = Attendance(subject: "ITP1122", minutes: 20)
    static var previews: some View {
        DetailView(result: result)
    }
}
