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
    var details: String?
}

struct TaskListView: View {
    @State private var tasks: [Task] = [
            Task(name: "coding task 1"),
            Task(name: "debugging"),
            Task(name: "Task 3"),
            Task(name: "Task 4"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
            Task(name: "Task 2"),
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
                        NavigationLink(destination: DetailView(name: task.name)) {
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
    
    let name: String

    var body: some View {
        Text("Detail View for \(name)")
    }
}
