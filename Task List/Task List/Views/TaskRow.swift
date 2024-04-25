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
  
  var body: some View {
    VStack {
      HStack {
        HStack {
          Text(task.title)
            .foregroundStyle(Color(Colors.task))
            .fontWeight(.heavy)
          Spacer()
          Button(action: {
            if let index = taskStore.tasks.firstIndex(where: { $0.id == task.id }) {
              taskStore.tasks[index].isCompleted.toggle()
            }
          }, label: {
            if task.isCompleted {
              Symbols.complete
                .foregroundColor(Colors.complete)
                .fontWeight(.heavy)
            } else {
              Symbols.incomplete
                .foregroundColor(Colors.incomplete)
                .fontWeight(.heavy)
            }
          })
        }
        .padding(.vertical, 5)
        Divider()
      }
      .padding(.horizontal, 20)
    }
  }
}
  
struct TaskRowPreview: PreviewProvider {
  static var previews: some View {
    TaskRow(taskStore: TaskStore(), task: Task())
  }
}
