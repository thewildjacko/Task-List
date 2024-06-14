/// Copyright (c) 2024 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct NameDetailView: View {
  @State var isPresented = false
  var store: UserStore
  var result: Result {
    store.userData.results[0]
  }
  var name: Name {
    result.name
  }
  
  var picture: Picture {
    result.picture
  }
  
  var body: some View {
    
    Form {
      List {
        HStack() {
          Spacer()
          
          Button {
            isPresented.toggle()
          } label: {
            ProfileImage(picture: picture.medium, multiplier: 2)
            .sheet(isPresented: $isPresented, content: {
              Button {
                isPresented.toggle()
              } label: {
                ProfileImage(picture: picture.large, multiplier: 4)
              }
              .presentationDetents([.medium])
            })
          }
          
          Spacer()
        }
        DetailRow(title: "Title", text: name.title)
        DetailRow(title: "First", text: name.first)
        DetailRow(title: "Last", text: name.last)
      }
      
      Section(header: Text("gender")) {
        Text(result.gender)
      }
      
      Section(header: Text("email")) {
        Text(result.email)
      }
      
      Section(header: Text("telephone")) {
        DetailRow(title: "phone", text: result.phone)
        DetailRow(title: "cell", text: result.cell)
      }
    }
  }
}

#Preview {
  NameDetailView(store: UserStore())
}


struct ProfileImage: View {
  var picture: String
  var multiplier: CGFloat
  
  var body: some View {
    AsyncImage(url: URL(string: picture)) { image in
      image.resizable()
    } placeholder: {
      Image(systemName: "person.circle.fill")
        .font(.system(size: 75 * multiplier))
        .foregroundStyle(.gray)
    }
    .frame(width: 64 * multiplier, height: 64 * multiplier)
    .clipShape(.rect(cornerRadius:15))
  }
}
