//
//  ContentView.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import SwiftUI

struct TaskList: View {
  @StateObject var taskStore: TaskStore

  @State private var showDetailView = false
  @State private var showNewTask = false
  @State private var currentIndex: Int = 0
  
  var body: some View {
    NavigationStack() {
      VStack {
        ScrollView {
          ForEach(Array(zip(taskStore.tasks.indices, taskStore.tasks)), id: \.1) { (index, task) in
            TaskRow(taskStore: taskStore, currentIndex: $currentIndex, showDetailView: $showDetailView, task: task, index: index)
          }
          .sheet(isPresented: $showNewTask) {
            AddTask(taskStore: taskStore, showNewTask: $showNewTask)
          }
        }
        .navigationTitle("My Tasks")
        Spacer()
        HStack {
          NewTaskButton(showNewTask: $showNewTask)
          Spacer()
        }
      }
      .padding()
    }
  }
}

#Preview {
  TaskList(taskStore: TaskStore())
}
