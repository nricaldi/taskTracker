//
//  task.swift
//  taskTracker
//
//  Created by Nico Ricaldi on 4/10/26.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
