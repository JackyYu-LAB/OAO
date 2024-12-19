import SwiftUI

struct ContentView: View {
    // TASK A: Define a state variable named manager using @State
    @State var manager = AttendanceManager()

    // TASK A (2b): Define two states: showAdd and showAttendance with default value `false`
    @State private var showAdd = false
    @State private var showAttendance = false

    var body: some View {
        // TASK B: Use a NavigationView to wrap the content
        NavigationView {
            // TASK C: Use a VStack to wrap the content
            VStack {
                // TASK D: Use a List to display the attendances
                List {
                    ForEach(0..<manager.getCount(), id: \.self) { i in
                        // TASK E: Get an instance of attendance
                        let attendance = manager.getAttendnace(at: i)

                        // TASK A (3b): Use NavigationLink to establish a link to DetailView
                        NavigationLink(destination: DetailView(result: attendance)) {
                            // TASK F: Make a Text element to display the subject name and minutes
                            Text("\(attendance.subject) - \(attendance.minutes) minutes")
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            // TASK G: Use the .navigationTitle modifier to change the title
            .navigationTitle("Attendance List")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    // TASK H: Two buttons: "See Attendance!" and "+"
                    Button("See Attendance!") {
                        showAttendance.toggle()
                    }
                    Button(action: {
                        showAdd.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            // TASK B (2b): Use .sheet modifier to present AddView
            .sheet(isPresented: $showAdd) {
                AddView(showAdd: $showAdd, manager: $manager)
            }
            // TASK A (4b): Use .sheet modifier to present AttendanceView
            .sheet(isPresented: $showAttendance) {
                AttendanceView(manager: $manager)
            }
        }
    }
}

struct ContentView_Preivew: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
