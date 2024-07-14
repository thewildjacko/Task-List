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

struct UserDataView: View {
  @State var store: UserStore
  
  var result: Result {
    store.userData.results[0]
  }
  
  var info: Info {
    store.userData.info
  }
  
  var location: Location {
    result.location
  }
  
  var login: Login {
    result.login
  }
  
  var picture: Picture {
    result.picture
  }
  
  var body: some View {
    Form {
      Section {
        VStack(alignment: .center) {
          NavigationLink(destination: NameDetailView(store: store)) {
            HStack(spacing: 15  ) {
              ProfileImage(picture: picture.thumbnail, multiplier: 1)
              
              VStack(alignment: .leading) {
                Text("\(result.name.title) \(result.name.first) \(result.name.last)")
                  .font(.callout)
                Text("\(result.email)")
                  .font(.caption)
                Text("ph: \(result.phone)")
                  .font(.caption)
                Text("cell: \(result.cell)")
                  .font(.caption)
              }
              
            }
          }
        }
      }
      
      Section(header: Text("Location")) {
        List {
          HStack(alignment: .firstTextBaseline) {
            Text("Address")
            Spacer()
            VStack(alignment: .leading) {
              Text("\(location.street.name) \(location.street.number.description)")
              Text("\(location.postcode.description) \(location.city), \(location.state)")
              Text("\(location.country)")
            }
          }
          DetailRow(title: "Coordinates", text: "\(location.coordinates.latitude), \(location.coordinates.longitude)")
        }
      }
      
      Section(header: Text("Timezone")) {
        Text("\(location.timezone.description) (\(location.timezone.offset) UTC)")
      }
      
      Section(header: Text("Login")) {
        List {
          NavigationLink(destination: {
            SingleItemDataRow(text: login.uuid)
              .navigationTitle("UUID")
          }) {
              Text("UUID")
          }
          DetailRow(title: "Username", text: login.username)
          PasswordRow(title: "password", text: login.password)
          DetailRow(title: "Salt", text: login.salt)
          NavigationLink(destination: {
            SingleItemDataRow(text: login.md5)
              .navigationTitle("md5")
          }) {
              Text("md5")
          }
          NavigationLink(destination: {
            SingleItemDataRow(text: login.sha1)
              .navigationTitle("sha1")
          }) {
              Text("sha1")
          }
          NavigationLink(destination: {
            SingleItemDataRow(text: login.sha256)
              .navigationTitle("sha256")
          }) {
              Text("sha256")
          }
        }
      }
      
      Section(header: Text("DOB")) {
        DetailRow(title: "Date", text: result.dob.date)
        DetailRow(title: "Age", text: "\(result.dob.age)")
      }
      
      Section(header: Text("Registered")) {
        DetailRow(title: "Date", text: result.registered.date)
        DetailRow(title: "Age", text: "\(result.registered.age)")
      }
      
      Section(header: Text("Id")) {
        DetailRow(title: "ID", text: result.id.name)
        DetailRow(title: "Value", text: "\(result.id.value)")
      }
      
      Section {
        DetailRow(title: "Nat", text: result.nat)
      }
      
      Section(header: Text("Info")) {
        DetailRow(title: "Seed", text: info.seed)
        DetailRow(title: "Results", text: "\(info.results)")
        DetailRow(title: "Page", text: "\(info.page)")
        DetailRow(title: "Version", text: info.version)
      }
    }
  }
}


#Preview {
  UserDataView(store: UserStore())
}
