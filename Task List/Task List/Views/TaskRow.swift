//
//  TaskView.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import SwiftUI

struct TaskRow: View {
  @ObservedObject var taskStore: TaskStore
  
  @Binding var currentIndex: Int
  @Binding var showDetailView: Bool
  
  var task: Task
  var index: Int
  
  var body: some View {
    VStack {
      HStack {
        TaskViewButton(taskStore: taskStore, currentIndex: $currentIndex, showDetailView: $showDetailView, task: task, index: index)
        CompletionButton(taskStore: taskStore, task: task, index: index)
      }
      .padding(.vertical, 5)
      Divider()
    }
    .padding(.horizontal, 20)
  }
}

struct TaskRowPreview: PreviewProvider {
  static private let showDetailView = Binding.constant(false)
  static private let task = Task()
  static private let currentIndex = Binding.constant(0)
  
  static var previews: some View {
    TaskRow(taskStore: TaskStore(), currentIndex: currentIndex, showDetailView: showDetailView, task: task, index: 0)
  }
}
