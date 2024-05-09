//
//  Constants.swift
//  Task List
//
//  Created by Jake Smolowe on 3/26/24.
//

import Foundation
import SwiftUI

enum Constants {
  enum Colors {
    public static let incomplete = Color("IncompleteColor")
    public static let complete = Color("CompleteColor")
    public static let task = Color("TaskColor")
    public static let matrix = Color("MatrixColor")
    public static let matrixHighlighted = Color("MatrixHighlightColor")
  }
  
  enum Symbols {
    public static let incomplete = Image(systemName: "square")
    public static let complete = Image(systemName: "checkmark.square")
    public static let newTask = Image(systemName: "plus.circle.fill")
    public static let backwardChevron = Image(systemName: "chevron.backward")
    public static let incompleteTab = Image(systemName: "list.bullet.circle")
    public static let completedTab = Image(systemName: "checkmark.circle")
    public static let matrix = Image(systemName: "square.grid.2x2")
  }
}

typealias Symbols = Constants.Symbols
typealias Colors = Constants.Colors
