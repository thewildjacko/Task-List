//
//  AddTask.swift
//  Task List
//
//  Created by Jake Smolowe on 3/26/24.
//

import SwiftUI

struct TaskView: View {
  @ObservedObject var taskStore: TaskStore
  
  @Binding var showTaskView: Bool
  @Binding var currentIndex: Int
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Task Title")) {
          TextField(taskStore.tasks[currentIndex].title, text: $taskStore.tasks[currentIndex].title)
        }
        .fontWeight(.bold)
        
        Section(header: Text("Notes")) {
          TextField(taskStore.tasks[currentIndex].notes, text: $taskStore.tasks[currentIndex].notes, axis: .vertical)
            .lineLimit(5...)
        }
        
        Section() {
          Toggle(isOn: $taskStore.tasks[currentIndex].isCompleted) {
            Text("Completed:")
              .fontWeight(.bold)
          }
        }
      }
      .navigationBarItems(
        leading:
          Button(action: {
            dismiss()
          }) {
            HStack(spacing: 3) {
              Symbols.backwardChevron
              Text("My Tasks")
                .fontWeight(.medium)
            }
          }
      )
    }
  }
  
  private func dismiss() {
    showTaskView.toggle()
  }
}


struct TaskViewPreview: PreviewProvider {
  static private let showTaskView = Binding.constant(false)
  static private let currentIndex = Binding.constant(0)
  
  static var previews: some View {
    TaskView(taskStore: TaskStore(), showTaskView: showTaskView, currentIndex: currentIndex)
  }
}
