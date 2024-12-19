//
//  AttendanceManager.swift
//  Attendance
//
//  Created by itst on 19/12/2024.
//

struct AttendanceManager {

 //GIVEN, the attendance array
 fileprivate var attendances : [Attendance] = []

 //GIVEN, preload 5 set of data
 init() {
 let result1 = Attendance(subject : "ITP4206", minutes: 180)
 let result2 = Attendance(subject : "ITP4221", minutes: 120)
 let result3 = Attendance(subject : "ITP4221", minutes: 118)
 let result4 = Attendance(subject : "ITP4206", minutes: 90)
 let result5 = Attendance(subject : "ITP4221", minutes: 89)
 let result6 = Attendance(subject : "ITP4909", minutes: 78)
 self.attendances = [result1, result2, result3, result4, result5, result6]
 }

 func getCount() -> Int {
 //TASK A: - return the number of the attendances Array
     return attendances.count
 }

 func getAttendnace(at index : Int) -> Attendance {
 //TASK B: return the attendance instance at the given index in attendances array
     return attendances[index]
 }

 //TASK C: define the function mutating func add(_ attendance : Attendance)
 //function: append the attendance into the attendance s array
    mutating func add(_ attendance: Attendance) {
        attendances.append(attendance)
    }

 //TASK D: define a mutating function remove, it accepts 1 int parameter named index
 //function: remove the element in attendances at the given index by attendance s.remove(at: index)
    mutating func remove(at index: Int) {
        attendances.remove(at: index)
    }
    
 //TASK E: define the function name getAttendances
 //function: The function will return the attendance s array
    func getAttedances() -> [Attendance] {
        return attendances
    }
}
