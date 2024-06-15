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

struct UserData: Encodable {
  var results: [Result]
  var info: Info
  
  enum CodingKeys: CodingKey {
    case results, info
  }
  
  enum ResultsKeys: CodingKey {
    case gender, name, location, email, login, dob, registered, phone, cell, id, picture, nat
  }
  
  enum InfoKeys: CodingKey {
    case seed, results, page, version
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    var resultsContainer = container.nestedUnkeyedContainer(forKey: .results)
    
    for result in results {
      var resultContainer = resultsContainer.nestedContainer(keyedBy: ResultsKeys.self)
      try resultContainer.encode(result.gender, forKey: .gender)
      try resultContainer.encode(result.name, forKey: .name)
      try resultContainer.encode(result.location, forKey: .location)
      try resultContainer.encode(result.email, forKey: .email)
      try resultContainer.encode(result.login, forKey: .login)
      try resultContainer.encode(result.dob, forKey: .dob)
      try resultContainer.encode(result.registered, forKey: .registered)
      try resultContainer.encode(result.phone, forKey: .phone)
      try resultContainer.encode(result.cell, forKey: .cell)
      try resultContainer.encode(result.id, forKey: .id)
      try resultContainer.encode(result.picture, forKey: .picture)
      try resultContainer.encode(result.nat, forKey: .nat)
    }
    
    var infoContainer = container.nestedContainer(keyedBy: InfoKeys.self, forKey: .info)
    try infoContainer.encode(info.seed, forKey: .seed)
    try infoContainer.encode(info.results, forKey: .results)
    try infoContainer.encode(info.page, forKey: .page)
    try infoContainer.encode(info.version, forKey: .version)
  }
}
  
extension UserData: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    var resultsContainer = try container.nestedUnkeyedContainer(forKey: .results)
    
    var resultsArray: [Result] = []
    
    while !resultsContainer.isAtEnd {
      let resultContainer = try resultsContainer.nestedContainer(keyedBy: ResultsKeys.self)
      let gender = try resultContainer.decode(String.self, forKey: .gender)
      let name = try resultContainer.decode(Name.self, forKey: .name)
      let location = try resultContainer.decode(Location.self, forKey: .location)
      let email = try resultContainer.decode(String.self, forKey: .email)
      let login = try resultContainer.decode(Login.self, forKey: .login)
      let dob = try resultContainer.decode(DateAndAge.self, forKey: .dob)
      let registered = try resultContainer.decode(DateAndAge.self, forKey: .registered)
      let phone = try resultContainer.decode(String.self, forKey: .phone)
      let cell = try resultContainer.decode(String.self, forKey: .cell)
      let id = try resultContainer.decode(Id.self, forKey: .id)
      let picture = try resultContainer.decode(Picture.self, forKey: .picture)
      let nat = try resultContainer.decode(String.self, forKey: .nat)
      let result = Result(gender: gender, name: name, location: location, email: email, login: login, dob: dob, registered: registered, phone: phone, cell: cell, id: id, picture: picture, nat: nat)
      resultsArray.append(result)
    }
    
    results = resultsArray
    
    let infoContainer = try container.nestedContainer(keyedBy: InfoKeys.self, forKey: .info)
    info = try container.decode(Info.self, forKey: .info)
    info.seed = try infoContainer.decode(String.self, forKey: .seed)
    info.results = try infoContainer.decode(Int.self, forKey: .results)
    info.page = try infoContainer.decode(Int.self, forKey: .page)
    info.version = try infoContainer.decode(String.self, forKey: .version)
  }
}
