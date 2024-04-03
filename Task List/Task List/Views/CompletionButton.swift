//
//  CompletionButton.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import SwiftUI

struct CompletionButton: View {
  @ObservedObject var taskStore: TaskStore
  
  var task: Task
  var index: Int
  
  var body: some View {
    Button(
      action: {
        taskStore.toggleComplete(index: index)
      }, label: {
        let box: (symbol: Image, color: Color) = task.isCompleted ? (Symbols.complete, Colors.complete) : (Symbols.incomplete, Colors.incomplete)
        
        box.symbol
          .foregroundStyle(box.color)
          .fontWeight(.heavy)
      })
  }
}

struct CompletetionButtonPreview: PreviewProvider {
  static private let task = Task()
  
  static var previews: some View {
    CompletionButton(taskStore: TaskStore(), task: task, index: 0)
  }
}
