//
//  Attendance.swift
//  Attendance
//
//  Created by itst on 19/12/2024.
//

import Foundation

struct Attendance: Identifiable {
    var id: String = UUID().uuidString
    var subject: String
    var minutes: Int
}
