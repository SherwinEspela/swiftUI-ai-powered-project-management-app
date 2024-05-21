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
    
    let onDismiss: (String) -> Void
    
    var body: some View {
        VStack {
            Text("Add Task")
                .font(.title)
            TextField("Task Name", text: $name)
                .textFieldStyle(.roundedBorder)
            TextField("Description", text: $description)
                .textFieldStyle(.roundedBorder)
            Button("Dismiss") {
                onDismiss("dismissed....")
                isShowingModal.toggle()
            }
            Spacer()
        }
        .padding()
    }
}

struct AddTaskModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskModalView(isShowingModal: .constant(true), onDismiss:{ _ in })
    }
}
