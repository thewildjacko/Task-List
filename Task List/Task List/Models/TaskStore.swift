//
//  TaskStore.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import Foundation

class TaskStore: ObservableObject {
  @Published var tasks: [Task] = [
    Task(id: UUID(), title: "Feed cats", isCompleted: false, notes: "Make sure each cat gets the correct wet food.", category: .Home),
    Task(id: UUID(), title: "Patience", isCompleted: false, notes: "Working on left hand independence in 5/4, keeping the groove steady while soloing, creating a dynamic contour over the course of the solo. Practicing RH triplets, 1/8 notes, 16th notes and switching between while maintaining a solid LH. This is really tough! Almost as hard as coding. Coding is very difficult but I'm learning more every day!", category: .Work),
    Task(id: UUID(), title: "Duolingo", isCompleted: false, notes: "Learning Spanish", category: .NoCategory),
    Task(id: UUID(), title: "What'd I Say", isCompleted: false, notes: "Practice new breaks", category: .Work),
    Task(id: UUID(), title: "Vacuum Kitchen", isCompleted: false, notes: "Hoover up all that dust!", category: .Home),
    Task(id: UUID(), title: "Goodbye Gospel", isCompleted: false, notes: "Practice final solo section voicings", category: .Work),
    Task(id: UUID(), title: "Make bed", isCompleted: false, notes: "It'll make you feel better at bedtime.", category: .Home),
    Task(id: UUID(), title: "Call a Friend", isCompleted: false, notes: "It's good to stay in touch", category: .Personal),
    Task(id: UUID(), title: "Work Out", isCompleted: false, notes: "Yoga", category: .Personal),
    Task(id: UUID(), title: "Transit", isCompleted: false, notes: "Practicing that meter-switching final", category: .Work),
    Task(id: UUID(), title: "Go out for drinks", isCompleted: false, notes: "Pick a bar close to home.", category: .Personal),
    Task(id: UUID(), title: "Take Nap", isCompleted: false, notes: "45 minutes", category: .Personal),
    Task(id: UUID(), title: "Phoenix", isCompleted: false, notes: "Working on transitions between sections", category: .Work),
    Task(id: UUID(), title: "Yardbird Suite", isCompleted: false, notes: "Bebop lines", category: .Work),
    Task(id: UUID(), title: "Limelight", isCompleted: false, notes: "Geoff Keezer ftw", category: .Work),
    Task(id: UUID(), title: "Driftin'", isCompleted: false, notes: "Playing some old school Herbie Hancock", category: .Work),
    Task(id: UUID(), title: "Spain", isCompleted: false, notes: "Getting ready for Blue Barn gigs with Jeff", category: .Work),
    Task(id: UUID(), title: "Minor Scales", isCompleted: false, notes: "G Melodic minor, 60 bpm", category: .Work),
    Task(id: UUID(), title: "Pentatonics", isCompleted: false, notes: "B♭ pentatonic, 8th notes, triplets and 16th notes at 45 bpm", category: .Work),
    Task(id: UUID(), title: "Transposition", isCompleted: false, notes: "minor ii-V-i's in all keys", category: .Work),
    Task(id: UUID(), title: "Wordle", isCompleted: false, notes: "Go for two!", category: .NoCategory)
  ]

  func addTask(title: String, isCompleted: Bool, notes: String, category: Category) {
    let newTask = Task(id: UUID(), title: title, isCompleted: isCompleted, notes: notes, category: category)
    tasks.append(newTask)
  }
  
  func toggleComplete(index: Int) {
    tasks[index].isCompleted.toggle()
  }
}
