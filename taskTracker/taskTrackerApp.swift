//
//  taskTrackerApp.swift
//  taskTracker
//
//  Created by Nico Ricaldi on 4/9/26.
//

import SwiftUI
import SwiftData

@main
struct taskTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
