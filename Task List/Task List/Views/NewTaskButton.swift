//
//  CompletetionBox.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import SwiftUI

struct NewTaskButton: View {
  @Binding var showNewTask: Bool
  
  var body: some View {
    Button(action: {
      showNewTask.toggle()
    }, label: {
      HStack {
        Symbols.newTask
        Text(" New Task")
      }
      .foregroundStyle(Colors.task)
      .fontWeight(.semibold)
    })
  }
}

struct NewTaskButtonPreview: PreviewProvider {
  static private let showNewTask = Binding.constant(false)
  
  static var previews: some View {
    NewTaskButton(showNewTask: showNewTask)
  }
}
