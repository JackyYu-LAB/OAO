import SwiftUI

struct AddView: View {
    
    // Given: Two bindings from the Attendance List Page
    @Binding var showAdd: Bool
    @Binding var manager: AttendanceManager
    
    // TASK A: Create two states for subject and minutes with default values as empty strings
    @State private var subject: String = ""
    @State private var minutes: String = ""
    
    var body: some View {
        VStack {
            Text("Add New Record")
                .bold()
                .font(.title)
                .padding(.bottom, 20)
            
            // TASK B: Two text fields with rounded borders
            TextField("Subject", text: $subject)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 10)
            
            TextField("Minutes", text: $minutes)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding(.bottom, 10)
            
            // TASK C: Alert text for validation errors
            if !isValid {
                Text("All textfields must not be empty! And minutes field must be a number!")
                    .font(.footnote)
                    .foregroundStyle(.red)
                    .padding(.bottom, 10)
            }
            
            Spacer()
            
            HStack {
                // TASK D: Add button
                Button(action: {
                    if isValid {
                        let newAttendance = Attendance(subject: subject, minutes: Int(minutes) ?? 0)
                        manager.add(newAttendance)
                        
                        showAdd = false
                    }
                }, label: {
                    Spacer()
                    Text("Add")
                    Spacer()
                })
                .frame(height: 50)
                .buttonStyle(.bordered)
                .padding(10)
                
                // TASK E: Cancel button
                Button(action: {
                    showAdd = false
                }, label: {
                    Spacer()
                    Text("Cancel")
                    Spacer()
                })
                .frame(height: 50)
                .buttonStyle(.bordered)
                .padding(10)
            }
        }
        .padding()
    }
    
    // TASK F: Computed property for validation
    var isValid: Bool {
        return !subject.isEmpty && !minutes.isEmpty && Int(minutes) != nil
    }
}

struct AddView_Preview: PreviewProvider {
    @State static var manager: AttendanceManager = AttendanceManager()
    @State static var showAdd = false
    static var previews: some View {
        AddView(showAdd: $showAdd, manager: $manager)
    }
}
