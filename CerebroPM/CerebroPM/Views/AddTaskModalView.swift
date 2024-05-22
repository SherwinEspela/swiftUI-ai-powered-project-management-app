//
//  AddTaskModalView.swift
//  CerebroPM
//
//  Created by Sherwin Espela on 2024-05-21.
//

import SwiftUI

struct AddTaskModalView: View {
    
    @Binding var isShowingModal: Bool
    @State private var name = ""
    @State private var description = ""
    
    let onDismissWithTask: (TaskModel) -> Void
    
    var body: some View {
        VStack {
            Text("Add Task")
                .font(.title)
            TextField("Task Name", text: $name)
                .textFieldStyle(.roundedBorder)
            TextField("Description", text: $description)
                .textFieldStyle(.roundedBorder)
            Button("Dismiss") {
                let task = TaskModel(name: name, description: description, completed: false)
                onDismissWithTask(task)
                isShowingModal.toggle()
            }
            Spacer()
        }
        .padding()
    }
}

struct AddTaskModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskModalView(isShowingModal: .constant(true), onDismissWithTask:{ _ in })
    }
}
