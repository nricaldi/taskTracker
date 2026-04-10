//
//  ContentView.swift
//  taskTracker
//
//  Created by Nico Ricaldi on 4/9/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var newTaskTitle = ""
    @State private var taskCount: Int = 0
    @Query private var tasks: [Task]
    @Environment(\.modelContext) private var modelContext

    private func addTask () {
        modelContext.insert(Task(title: newTaskTitle))
        newTaskTitle = ""
    }

    private func toggleTask (task: Task) {
        task.isCompleted.toggle()
    }

    private func deleteTask (at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(tasks[index])
        }
    }

    var body: some View {
        VStack {
            Text("Task Tracker Ting")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.red)
                .padding(.bottom, 2)

            Text("Keep track of dem tings on dis ting")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.bottom, 8)

            HStack {
                TextField("Make a billion dollars", text: $newTaskTitle)
                    .textFieldStyle(.roundedBorder)

                Button("Add ting") {
                    addTask()
                }
                .buttonStyle(.glassProminent)
                .disabled(newTaskTitle.isEmpty)
            }
            .padding(.horizontal, 20)
        }
        .padding(.bottom, 16)

        List {
            ForEach(tasks) { task in
                HStack {
                    Image(systemName: task.isCompleted ? "circlebadge.fill" : "circlebadge")
                    Text(task.title)
                        .strikethrough(task.isCompleted)
                }
                .onTapGesture {
                    toggleTask(task: task)
                }
            }
            .onDelete(perform: deleteTask)
        }
    }
}

#Preview {
    ContentView()
}
