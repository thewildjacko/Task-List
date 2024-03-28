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
  }
  
  enum Symbols {
    public static let incomplete = Image(systemName: "square")
    public static let complete = Image(systemName: "checkmark.square")
    public static let newTask = Image(systemName: "plus.circle.fill")
    public static let backwardChevron = Image(systemName: "chevron.backward")
  }
}

typealias Symbols = Constants.Symbols
typealias Colors = Constants.Colors
