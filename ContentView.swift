//
//  ContentView.swift
//  ToDoList
//
//  Created by Jufri Mahardi on 05/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newTask: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Form input untuk menambah tugas baru
                HStack {
                    TextField("Tuliskan tugas baru", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        guard !newTask.isEmpty else { return }
                        viewModel.addItem(title: newTask)
                        newTask = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                .padding()
                
                // Daftar Tugas
                List {
                    ForEach(viewModel.items) { item in
                        HStack {
                            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    viewModel.toggleItem(item)
                                }
                            Text(item.title)
                                .strikethrough(item.isCompleted, color: .gray)
                        }
                    }
                    .onDelete(perform: viewModel.deleteItem)
                }
            }
            .navigationTitle("To-Do List")
        }
    }
}
