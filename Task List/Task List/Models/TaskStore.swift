//
//  TaskStore.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import Foundation

class TaskStore: ObservableObject {
  @Published var tasks: [Task] = [
    Task(id: UUID(), title: "Patience", isCompleted: false, notes: "Working on left hand independence in 5/4, keeping the groove steady while soloing, creating a dynamic contour over the course of the solo. Practicing RH triplets, 1/8 notes, 16th notes and switching between while maintaining a solid LH. This is really tough! Almost as hard as coding. Coding is very difficult but I'm learning more every day!"),
    Task(id: UUID(), title: "What'd I Say", isCompleted: false, notes: "Practice new breaks"),
    Task(id: UUID(), title: "Goodbye Gospel", isCompleted: false, notes: "Practice final solo section voicings"),
    Task(id: UUID(), title: "Transit", isCompleted: false, notes: "Practicing that meter-switching final"),
    Task(id: UUID(), title: "Phoenix", isCompleted: false, notes: "Working on transitions between sections"),
    Task(id: UUID(), title: "Yardbird Suite", isCompleted: false, notes: "Bebop lines"),
    Task(id: UUID(), title: "Limelight", isCompleted: false, notes: "Geoff Keezer ftw"),
    Task(id: UUID(), title: "Driftin'", isCompleted: false, notes: "Playing some old school Herbie Hancock"),
    Task(id: UUID(), title: "Spain", isCompleted: false, notes: "Getting ready for Blue Barn gigs with Jeff"),
    Task(id: UUID(), title: "Minor Scales", isCompleted: false, notes: "G Melodic minor, 60 bpm"),
    Task(id: UUID(), title: "Pentatonics", isCompleted: false, notes: "B♭ pentatonic, 8th notes, triplets and 16th notes at 45 bpm"),
    Task(id: UUID(), title: "Transposition", isCompleted: false, notes: "minor ii-V-i's in all keys")
  ]

  func addTask(title: String, isCompleted: Bool, notes: String) {
    let newTask = Task(id: UUID(), title: title, isCompleted: isCompleted, notes: notes)
    tasks.append(newTask)
  }
  
  func toggleComplete(index: Int) {
    tasks[index].isCompleted.toggle()
  }
}
