//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Jufri Mahardi on 06/06/25.
//

import Foundation

// Model yang merepresentasikan 1 tugas
struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}
