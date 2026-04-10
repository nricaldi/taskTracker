//
//  ContentView.swift
//  taskTracker
//
//  Created by Nico Ricaldi on 4/9/26.
//

import SwiftUI

struct ContentView: View {
    @State private var newTaskTitle = ""
    @State private var taskCount: Int = 0
    @State private var tasks: [Task] = [
        Task(title: "Finish dis tutorial"),
        Task(title: "Figure out mini check next steps"),
        Task(title: "Build mini chef prototype")
    ]

    private func addTask () {
        tasks.append(Task(title: newTaskTitle))
        newTaskTitle = ""
    }

    private func toggleTask (task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    private func deleteTask (at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
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
