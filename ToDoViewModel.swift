//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Jufri Mahardi on 06/06/25.
//

import Foundation

// ViewModel untuk mengelola list tugas
class TodoViewModel: ObservableObject {
    @Published var items: [TodoItem] = []
    
    // Menambah tugas baru
    func addItem(title: String) {
        let newItem = TodoItem(title: title)
        items.append(newItem)
    }
    
    // Menandai tugas selesai atau belum
    func toggleItem(_ item: TodoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }
    
    // Menghapus tugas
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
}
