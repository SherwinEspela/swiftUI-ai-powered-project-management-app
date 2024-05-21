//
//  TaskModel.swift
//  CerebroPM
//
//  Created by Sherwin Espela on 2024-05-21.
//

import Foundation

struct TaskModel : Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let completed: Bool
}
