//
//  TaskViewButton.swift
//  Task List
//
//  Created by Jake Smolowe on 3/28/24.
//

import SwiftUI

struct TaskViewButton: View {
  @ObservedObject var taskStore: TaskStore
  
  @Binding var currentIndex: Int
  @Binding var showDetailView: Bool
  
  var task: Task
  var index: Int
  
  var body: some View {
    Button {
      currentIndex = index
      showDetailView.toggle()
    } label: {
      HStack {
        Text(task.title)
          .foregroundStyle(Color(Colors.task))
        .fontWeight(.heavy)
        Spacer()
      }
    }
    .fullScreenCover(isPresented: $showDetailView, content:  {
      TaskView(taskStore: taskStore, showTaskView: $showDetailView, currentIndex: $currentIndex)
    })
  }
}

struct TaskViewButtonPreview: PreviewProvider {
  static private let showDetailView = Binding.constant(false)
  static private let task = Task()
  static private let currentIndex = Binding.constant(0)
  
  static var previews: some View {
    TaskViewButton(taskStore: TaskStore(), currentIndex: currentIndex, showDetailView: showDetailView, task: task, index: 0)
  }
}
