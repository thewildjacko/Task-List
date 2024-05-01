//
//  AddTask.swift
//  Task List
//
//  Created by Jake Smolowe on 3/26/24.
//

import SwiftUI

struct AddTask: View {
  @ObservedObject var taskStore: TaskStore
  
  @Binding var showNewTask: Bool
  @State private var title = ""
  @State private var isCompleted = false
  @State private var notes = ""
  @State private var category = Category.NoCategory
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Task Title")) {
          TextField("Task Title", text: $title)
        }
        Section(header: Text("Category")) {
          Picker(
            selection: $category, label: Text("Category")) {
              Text("None").tag(Category.NoCategory)
              Text("Personal").tag(Category.Personal)
              Text("Work").tag(Category.Home)
              Text("Home").tag(Category.Home)
            }
        }
        Section(header: Text("Notes")) {
          TextField("Notes", text: $notes, axis: .vertical)
            .lineLimit(5...)
        }
      }
      .navigationBarTitle(Text("Adding New Task"), displayMode: .inline)
      .navigationBarItems(
        leading:
          Button(action: dismiss) {
            Text("Cancel")
          },
        trailing:
          Button(action: addTask) {
            Text("Add")
              .disabled(title.isEmpty)
          }
      )
    }
  }
  
  private func addTask() {
    taskStore.addTask(title: title, isCompleted: isCompleted, notes: notes, category: category)
    dismiss()
  }
  
  private func dismiss() {
    showNewTask.toggle()
  }
}

struct AddTaskPreview: PreviewProvider {
  static private let showNewTask = Binding.constant(false)
  
  static var previews: some View {
    AddTask(taskStore: TaskStore(), showNewTask: showNewTask)
  }
}
