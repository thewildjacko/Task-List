//
//  MatrixView.swift
//  Task List
//
//  Created by Jake Smolowe on 4/30/24.
//

import SwiftUI

struct MatrixCard: View {
  @ObservedObject var taskStore: TaskStore
  var category: Category
  var cardColor: Color = .matrix
  
  var body: some View {
    VStack {
      Text(category.rawValue)
      Spacer()
      Text("\(taskStore.tasks.filter { $0.category == category }.count)")
    }
    .padding(.horizontal, 10.0)
    .padding(.vertical, 40.0)
    .foregroundStyle(.white)
    .font(.title2)
    .fontWeight(.heavy)
    .frame(width: 170, height: 170)
    .background(cardColor)
    .clipShape(RoundedRectangle(cornerRadius: 25.0))
    .overlay(
      RoundedRectangle(cornerRadius: 25.0)
        .stroke(cardColor == .matrixHighlight ? .black : .clear, lineWidth: 5)
    )
  }
}

struct MatrixView: View {
  @ObservedObject var taskStore: TaskStore
  @State var cardColor: Color = .matrix
  @Binding var selectedCategory: Category
  @Binding var categoryIsSelected: Bool
  
  var matrixColumns: [GridItem] {
    [GridItem(.fixed(180)),
     GridItem(.fixed(180))]
  }
  
  var body: some View {
    LazyVGrid(columns: matrixColumns, spacing: 20) {
      ForEach(Category.allCases) { category in
        Button {
          if !categoryIsSelected {
            selectedCategory = category
            categoryIsSelected.toggle()
          } else {
            if selectedCategory == category {
              categoryIsSelected.toggle()
            } else {
              selectedCategory = category
            }
          }
          cardColor = selectedCategory == category ? .white : .matrix
        } label: {
          MatrixCard(taskStore: taskStore, category: category, cardColor: selectedCategory == category && categoryIsSelected ? .matrixHighlight : .matrix)
            .aspectRatio(1.0, contentMode: .fit)
        }
      }
    }
  }
}

struct MatrixViewPreview: PreviewProvider {
  static var previews: some View {
    MatrixView(taskStore: TaskStore(), selectedCategory: Binding.constant(.NoCategory), categoryIsSelected: Binding.constant(false)) //, selectedTab: Binding.constant(.matrix)
  }
}
