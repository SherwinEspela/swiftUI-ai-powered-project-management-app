//
//  TaskListView.swift
//  CerebroPM
//
//  Created by Sherwin Espela on 2024-05-20.
//

import SwiftUI
import os

struct TaskListView: View {
    @State private var allTasks: [TaskModel] = [
        TaskModel(name: "task sample 1", description: "task sample 1 description", completed: false),
        TaskModel(name: "task sample 2", description: "task sample 1 description", completed: false),
        TaskModel(name: "task sample 3", description: "task sample 1 description", completed: false)
    ]
    
    @State private var filteredTasks: [TaskModel] = []
    @State private var isShowingModal = false
    @State private var search: String = ""
        
        var body: some View {
            NavigationStack {
                List(filteredTasks) { task in
                    NavigationLink(value: task) {
                        Text(task.name)
                    }
                }
                .listStyle(.plain)
                .searchable(text: $search)
                .onChange(of: search, perform: { newSearch in
                    
                    if(newSearch.isEmpty){
                        filteredTasks = allTasks
                        return
                    }
                    
                    filteredTasks = allTasks.filter({ t in
                        t.name.lowercased().contains(newSearch.lowercased())
                    })
                })
                .navigationTitle("Tasks")
                .navigationDestination(for: TaskModel.self){ task in
                    TaskDetailView(task: task)
                }
                .onAppear {
                    filteredTasks = allTasks
                }
                
                Button("Add Task") {
                    isShowingModal.toggle()
                }
                .sheet(isPresented: $isShowingModal){
                    AddTaskModalView(isShowingModal: $isShowingModal) { task in
                        allTasks.append(task)
                        print("dismiss message: \(task.name)")
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
