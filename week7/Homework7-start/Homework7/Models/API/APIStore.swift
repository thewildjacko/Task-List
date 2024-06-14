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

import Foundation

class APIStore: ObservableObject {
  var apiFileExists = true
  
  struct APIS: Codable {
    let apis: [API]
    var count = 1425
    
    enum CodingKeys: String, CodingKey {
      case apis = "entries"
      case count
    }
  }
  
  @Published var names: APIS = APIS(apis: []) {
    didSet {
      saveJSON()
    }
  }
  
  let apisJSONURL = URL(fileURLWithPath: "apilist", relativeTo: FileManager.documentsDirectoryURL)
    .appendingPathExtension("json")
  
  init() {
    loadJSON()
  }

  private func loadJSON() {
    guard let apisJSONURL = Bundle.main.url(forResource: "apilist", withExtension: "json") else {
      print("File not in bundle")
      guard FileManager.default.fileExists(atPath: apisJSONURL.path) else {
        apiFileExists = false
        print("File doesn't exist")
        return
      }
      return
    }
    
//    print(FileManager.documentsDirectoryURL)
    
    let decoder = JSONDecoder()
    
    do {
      let apis = try Data(contentsOf: apisJSONURL)
      let apilist = try decoder.decode(APIStore.APIS.self, from: apis)
      names = apilist
      
    } catch let error {
      print("decoding error!")
      print(error)
    }
  }
  
  private func saveJSON() {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    do {
      let apisData = try encoder.encode(names)
      try apisData.write(to: apisJSONURL, options: .atomicWrite)
    } catch let error {
      print("encoding error")
      print(error)
    }
  }
}
