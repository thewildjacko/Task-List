//
//  ContentView.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import SwiftUI

struct TaskList: View {
  @StateObject var taskStore: TaskStore

  @State private var showTaskView = false
  @State private var showNewTask = false
  @State private var currentIndex: Int = 0
  @Binding var bindingTask: Task
  
  var body: some View {
    NavigationStack() {
      VStack {
        ScrollView {
          ForEach(taskStore.tasks) { task in
            NavigationLink(destination: DetailView(taskStore: taskStore, task: task), label: {
              TaskRow(taskStore: taskStore, task: task)
            })
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
  TaskList(taskStore: TaskStore(), bindingTask: Binding.constant(Task()))
}
