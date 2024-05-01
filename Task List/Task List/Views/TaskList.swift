//
//  ContentView.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import SwiftUI

enum TaskType {
  case incomplete
  case completed
  case matrix
}

struct TaskList: View {
  @StateObject var taskStore: TaskStore
  @State private var showNewTask = false
  @State private var selectedTab: TaskType = .incomplete
  @State private var taskToSearch = ""
  @State var selectedCategory: Category = .NoCategory
  @State var categoryIsSelected = false
  
  var tasks: [Task] {
    taskStore.tasks
  }
  
  var body: some View {
    NavigationStack() {
      VStack {
        TabView(
          selection: $selectedTab) {
            DisplayedTasks(
              taskStore: taskStore,
              tasks: searchTasks(tasks.filter { !$0.isCompleted }),
              selectedTab: $selectedTab
            )
            .tabItem {
              Symbols.incompleteTab
              Text("Tasks")
            }
            .tag(TaskType.incomplete)
            
            DisplayedTasks(
              taskStore: taskStore,
              tasks: searchTasks(tasks.filter { $0.isCompleted }),
              selectedTab: $selectedTab
            )
            .tabItem {
              Symbols.completedTab
              Text("Completed")
            }
            .tag(TaskType.completed)
            
            VStack {
              MatrixView(taskStore: taskStore, selectedCategory: $selectedCategory, categoryIsSelected: $categoryIsSelected)
              DisplayedTasks(
                taskStore: taskStore,
                tasks: searchTasks(tasks),
                selectedTab: $selectedTab
              )
            }
            .padding(.top, 15)
            .tabItem {
              Symbols.matrix
              Text("Matrix")
            }
            .tag(TaskType.matrix)
            .toolbar(selectedTab == .matrix ? .hidden : .automatic) // MARK: comment this line to reveal search bar on Matrix tab
        }
        .background(Color.white)
        .sheet(isPresented: $showNewTask) {
          AddTask(taskStore: taskStore, showNewTask: $showNewTask)
        }
        .searchable(text: $taskToSearch)
        .navigationTitle("My Tasks")
        Spacer()
        HStack {
          NewTaskButton(showNewTask: $showNewTask)
          Spacer()
        }
        .padding(.horizontal, 20)
      }
    }
  }
  
  func filterTasks(_ tasks: [Task]) -> [Task] {
    tasks.filter { $0.title.lowercased().contains(taskToSearch.lowercased()) }
  }
  
  func searchTasks(_ tasks: [Task]) -> [Task] {
    var filteredTasks = tasks
    
    switch selectedTab {
    case .incomplete, .completed:
      if taskToSearch != "" {
        filteredTasks = filterTasks(tasks)
      }
    case .matrix:
      let categoryTasks = tasks.filter { $0.category == selectedCategory }
      if categoryIsSelected { filteredTasks = categoryTasks }
      
      // MARK: Uncomment the if-else statement below for search functionality in Matrix tab
      /*
      if categoryIsSelected {
        let categoryTasks = taskStore.tasks.filter { $0.category == selectedCategory }
        filteredTasks = categoryTasks
        
        if taskToSearch != "" { filteredTasks = filterTasks(categoryTasks) }
      } else {
        if taskToSearch != "" { filteredTasks = filterTasks(tasks) }
      }
       */
    }
    
    return filteredTasks
  }
}

struct DisplayedTasks: View {
  @ObservedObject var taskStore: TaskStore
  var tasks: [Task]
  @Binding var selectedTab: TaskType
  
  var body: some View {
    List(tasks) { task in
      NavigationLink(destination: DetailView(taskStore: taskStore, task: task), label: {
        TaskRow(taskStore: taskStore, task: task, selectedTab: selectedTab)
      })
    }
    .listStyle(.plain)
  }
}

#Preview {
  TaskList(taskStore: TaskStore())
}
