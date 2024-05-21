//
//  TaskListView.swift
//  CerebroPM
//
//  Created by Sherwin Espela on 2024-05-20.
//

import SwiftUI
import os

struct TaskListView: View {
    @State private var tasks: [TaskModel] = [
        TaskModel(name: "coding task 1", description: "", completed: false),
        TaskModel(name: "debugging", description: "", completed: false),
        TaskModel(name: "Task 3", description: "", completed: false)
    ]
    
    @State private var showDetail = false
    @State private var selection: String? = nil
    @State private var isShowingModal = false
        
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
                
                Button("Add Task") {
                    isShowingModal.toggle()
                }
                .sheet(isPresented: $isShowingModal){
                    AddTaskModalView(isShowingModal: $isShowingModal) { message in
                        print("dismiss message: \(message)")
                    }
                }
            }
        }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct AddTaskModal: View {
    
    @State private var isShowingModal = false
    
    var body: some View {
        VStack {
            Text("Add Task")
                .font(.title)
            Text("This is a modal view with a title and a message.")
            Button("Dismiss") {
                isShowingModal.toggle()
            }
        }
        .padding()
    }
}
