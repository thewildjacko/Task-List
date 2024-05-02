//
//  TaskView.swift
//  Task List
//
//  Created by Jake Smolowe on 3/26/24.
//

import SwiftUI

struct DetailView: View {
  @ObservedObject var taskStore: TaskStore
  @State var task: Task
  
  var body: some View {
    Form {
      Section(header: Text("Task Title")) {
        TextField(task.title, text: $task.title)
      }
      .fontWeight(.bold)
      
      Section(header: Text("Category")) {
        Picker(
          selection: $task.category, label: Text("Category")) {
            Text("None").tag(Category.NoCategory)
            Text("Personal").tag(Category.Personal)
            Text("Work").tag(Category.Work)
            Text("Home").tag(Category.Home)
          }
      }
      
      Section(header: Text("Notes")) {
        TextField(task.notes, text: $task.notes, axis: .vertical)
          .lineLimit(5...)
      }
      
      Section() {
        Toggle(isOn: $task.isCompleted) {
          Text("Completed:")
            .fontWeight(.bold)
        }
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        Button(action: {
          if let index = taskStore.tasks.firstIndex(where: { $0.id == task.id }) {
            taskStore.tasks[index] = task
          }
        }, label: {
          Text("Update")
        })
      }
    }
  }
}

struct DetailViewPreview: PreviewProvider {
  static var previews: some View {
    DetailView(taskStore: TaskStore(), task: Task())
  }
}
