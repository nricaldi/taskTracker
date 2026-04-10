//
//  task.swift
//  taskTracker
//
//  Created by Nico Ricaldi on 4/10/26.
//

import Foundation
import SwiftData

@Model
class Task {
    var id = UUID()
    var title: String
    var isCompleted: Bool

    init(title: String) {
        self.title = title
        self.isCompleted = false
    }
}
