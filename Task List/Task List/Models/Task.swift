//
//  Task.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import Foundation

struct Task: Identifiable, Hashable {
  let id: UUID
  var title: String
  var isCompleted: Bool
  var notes: String
  
  init(id: UUID = UUID(), title: String = "New Task", isCompleted: Bool = false, notes: String = "Perfect, no notes") {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
    self.notes = notes
  }
}
