//
//  TaskView.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import SwiftUI

struct TaskRow: View {
  @ObservedObject var taskStore: TaskStore
  var task: Task
  var selectedTab: TaskType
  
  
  var body: some View {
    HStack {
      Text(task.title)
        .foregroundStyle(Color(Colors.task))
        .fontWeight(.heavy)
      Spacer()
      Button(action: {
        if let index = taskStore.tasks.firstIndex(where: { $0.id == task.id }) {
          withAnimation(.easeInOut(duration: 0.3)) {
            taskStore.tasks[index].toggleBoxColor()
          } completion: {
            taskStore.toggleComplete(index: index)
          }
        }
      }, label: {
        Symbols.incomplete
          .foregroundColor(Color.white)
          .colorMultiply(task.boxColor)
          .fontWeight(.heavy)
          .background(
            Symbols.complete
              .foregroundColor(.white)
              .colorMultiply(task.boxColor == Color("IncompleteColor") ? .clear : .complete)
              .fontWeight(.heavy)
              .animation(.easeInOut(duration: 0.25), value: task.boxColor)
          )
      })
      .buttonStyle(.borderless)
    }
    .padding(.vertical, 5)
    .padding(.horizontal, 20)
  }
}


struct TaskRowPreview: PreviewProvider {
  static var previews: some View {
    TaskRow(taskStore: TaskStore(), task: Task(), selectedTab: .incomplete)
  }
}
