//
//  Task.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Identifiable {
  var id: String { return self.rawValue }
  
  case Work, Personal, Home, NoCategory = "No Category"
}

struct Task: Identifiable, Hashable {
  let id: UUID
  var title: String
  var isCompleted: Bool
  var notes: String
  var boxColor: Color
  var category: Category
  
  init(id: UUID = UUID(), title: String = "New Task", isCompleted: Bool = false, notes: String = "Perfect, no notes", boxColor: Color = Colors.incomplete, category: Category = .NoCategory) {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
    self.notes = notes
    self.boxColor = boxColor
    self.category = category
  }
  
  mutating func toggleBoxColor() {
    boxColor = isCompleted ? Colors.incomplete : Colors.complete
  }
}
