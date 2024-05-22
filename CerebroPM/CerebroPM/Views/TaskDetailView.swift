//
//  TaskDetailView.swift
//  CerebroPM
//
//  Created by Sherwin Espela on 2024-05-21.
//

import SwiftUI

struct TaskDetailView: View {
    
    let task: TaskModel
    
    var body: some View {
        VStack {
            Text(task.name)
                .font(.title)
                .padding(.bottom)
            Text(task.description)
                .padding(.bottom)
            HStack {
                Image(systemName: task.completed ? "checkmark.square" : "square")
                    .padding(.leading)
                Text(task.completed ? "Completed" : "Not completed")
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
        .navigationTitle(task.name)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let testTask = TaskModel(name: "coding task 1", description: "", completed: false)
        NavigationStack {
            TaskDetailView(task: testTask)
        }
    }
}
