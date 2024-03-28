//
//  Task_ListApp.swift
//  Task List
//
//  Created by Jake Smolowe on 3/24/24.
//

import SwiftUI

@main
struct Task_ListApp: App {
    var body: some Scene {
        WindowGroup {
            TaskList(taskStore: TaskStore())
        }
    }
}
