//
//  TaskListView.swift
//  CerebroPM
//
//  Created by Sherwin Espela on 2024-05-20.
//

import SwiftUI

struct TaskListView: View {
    @State private var tasks: [TaskModel] = [
        TaskModel(name: "coding task 1", description: "", completed: false),
        TaskModel(name: "debugging", description: "", completed: false),
        TaskModel(name: "Task 3", description: "", completed: false)
    ]
    
    @State private var showDetail = false
    @State private var selection: String? = nil
        
        var body: some View {
            NavigationStack {
                List(tasks) { task in
                    NavigationLink(value: task) {
                        Text(task.name)
                    }
                }
                .navigationTitle("Tasks")
                .navigationDestination(for: TaskModel.self){ task in
                    TaskDetailView(task: task)
                }
            }
        }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
