//
//  TaskListView.swift
//  CerebroPM
//
//  Created by Sherwin Espela on 2024-05-20.
//

import SwiftUI

struct Task : Identifiable {
    var id = UUID()
    var name: String
    var description: String?
    var completed: Bool?
}

struct TaskListView: View {
    @State private var tasks: [Task] = [
            Task(name: "coding task 1"),
            Task(name: "debugging"),
            Task(name: "Task 3"),
            Task(name: "Task 4"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task Impossible", description: "An Impossible Task", completed: true),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 3")
        ]
    
    @State private var showDetail = false
    @State private var selection: String? = nil
        
        var body: some View {
            NavigationView {
                
                Table(tasks) {
                    TableColumn("Task Name") { task in
                        NavigationLink(destination: TaskDetail(task: task)) {
                            Text(task.name)
                        }
                    }
                }
                .navigationBarTitle("Task View")
            }
        }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct DetailView: View {
    
    let task: Task
    
    var body: some View {
        VStack {
            Text(task.name)
            Text(task.description ?? "")
            Button("Mark as completed") {
                // Mark the task as completed
            }
        }
    }
}

struct TaskDetail: View {
    let task: Task
    
    var body: some View {
        VStack {
            Text(task.name)
                .font(.title)
                .padding(.bottom)
            Text(task.description ?? "")
                .padding(.bottom)
            HStack {
                Image(systemName: task.completed ?? false ? "checkmark.square" : "square")
                    .padding(.leading)
                Text(task.completed ?? false ? "Completed" : "Not completed")
                    .padding(.trailing)
            }
            .padding(.bottom)
            Button("Mark as completed") {
                // Mark the task as completed
            
            }
            .padding(.bottom)
            Button("Delete task") {
                // Delete the task
            }
            .padding(.bottom)
        }
        .padding()
        .navigationBarTitle("Task Detail")
    }
}
