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

struct Result: Encodable {
  var gender: String
  var name: Name
  var location: Location
  var email: String
  var login: Login
  var dob: DateAndAge
  var registered: DateAndAge
  var phone: String
  var cell: String
  var id: Id
  var picture: Picture
  var nat: String
  
  enum CodingKeys: CodingKey {
    case gender, name, location, email, login, dob, registered, phone, cell, id, picture, nat
  }
  
  enum NameKeys: CodingKey {
    case title, first, last
  }
  
  enum LocationKeys: CodingKey {
    case street, city, state, country, postcode, coordinates, timezone
  }
  
  enum LoginKeys: CodingKey {
    case uuid, username, password, salt, md5, sha1, sha256
  }
  
  enum DateAndAgeKeys: CodingKey {
    case date, age
  }
  
  enum IDKeys: CodingKey {
    case name, value
  }
  
  enum PictureKeys: CodingKey {
    case large, medium, thumbnail
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(gender, forKey: .gender)
    
    var nameContainer = container.nestedContainer(keyedBy: NameKeys.self, forKey: .name)
    try nameContainer.encode(name.title, forKey: .title)
    try nameContainer.encode(name.first, forKey: .first)
    try nameContainer.encode(name.last, forKey: .last)
    
    var locationContainer = container.nestedContainer(keyedBy: LocationKeys.self, forKey: .location)
    try locationContainer.encode(location.street, forKey: .street)
    try locationContainer.encode(location.city, forKey: .city)
    try locationContainer.encode(location.country, forKey: .country)
    try locationContainer.encode(location.state, forKey: .state)
    try locationContainer.encode(location.postcode, forKey: .postcode)
    try locationContainer.encode(location.coordinates, forKey: .coordinates)
    try locationContainer.encode(location.timezone, forKey: .timezone)
    
    try container.encode(email, forKey: .email)

    var loginContainer = container.nestedContainer(keyedBy: LoginKeys.self, forKey: .login)
    try loginContainer.encode(login.uuid, forKey: .uuid)
    try loginContainer.encode(login.username, forKey: .username)
    try loginContainer.encode(login.password, forKey: .password)
    try loginContainer.encode(login.salt, forKey: .salt)
    try loginContainer.encode(login.md5, forKey: .md5)
    try loginContainer.encode(login.sha1, forKey: .sha1)
    try loginContainer.encode(login.sha256, forKey: .sha256)
    
    var dobContainer = container.nestedContainer(keyedBy: DateAndAgeKeys.self, forKey: .dob)
    try dobContainer.encode(dob.date, forKey: .date)
    try dobContainer.encode(dob.age, forKey: .age)
    
    var registeredContainer = container.nestedContainer(keyedBy: DateAndAgeKeys.self, forKey: .registered)
    try registeredContainer.encode(registered.date, forKey: .date)
    try registeredContainer.encode(registered.age, forKey: .age)
    
    try container.encode(phone, forKey: .phone)
    try container.encode(cell, forKey: .cell)
    
    var idContainer = container.nestedContainer(keyedBy: IDKeys.self, forKey: .id)
    try idContainer.encode(id.name, forKey: .name)
    try idContainer.encode(id.value, forKey: .value)
    
    var pictureContainer = container.nestedContainer(keyedBy: PictureKeys.self, forKey: .picture)
    try pictureContainer.encode(picture.large, forKey: .large)
    try pictureContainer.encode(picture.medium, forKey: .medium)
    try pictureContainer.encode(picture.thumbnail, forKey: .thumbnail)
    
    try container.encode(nat, forKey: .nat)
  }
}

extension Result: Decodable {
  init (from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    gender = try container.decode(String.self, forKey: .gender)
    
    let nameContainer = try container.nestedContainer(keyedBy: NameKeys.self, forKey: .name)
    name = try container.decode(Name.self, forKey: .name)
    name.title = try nameContainer.decode(String.self, forKey: .title)
    name.first = try nameContainer.decode(String.self, forKey: .first)
    name.last = try nameContainer.decode(String.self, forKey: .last)
    
    let locationContainer = try container.nestedContainer(keyedBy: LocationKeys.self, forKey: .location)
    location = try container.decode(Location.self, forKey: .location)
    location.street = try locationContainer.decode(Street.self, forKey: .street)
    location.city = try locationContainer.decode(String.self, forKey: .city)
    location.country = try locationContainer.decode(String.self, forKey: .country)
    location.state = try locationContainer.decode(String.self, forKey: .state)
    location.postcode = try locationContainer.decode(Int.self, forKey: .postcode)
    location.coordinates = try locationContainer.decode(Coordinates.self, forKey: .coordinates)
    location.timezone = try locationContainer.decode(Timezone.self, forKey: .timezone)
    
    email = try container.decode(String.self, forKey: .email)
    
    let loginContainer = try container.nestedContainer(keyedBy: LoginKeys.self, forKey: .login)
    login = try container.decode(Login.self, forKey: .login)
    login.uuid = try loginContainer.decode(String.self, forKey: .uuid)
    login.username = try loginContainer.decode(String.self, forKey: .username)
    login.password = try loginContainer.decode(String.self, forKey: .password)
    login.salt = try loginContainer.decode(String.self, forKey: .salt)
    login.md5 = try loginContainer.decode(String.self, forKey: .md5)
    login.sha1 = try loginContainer.decode(String.self, forKey: .sha1)
    login.sha256 = try loginContainer.decode(String.self, forKey: .sha256)
    
    let dobContainer = try container.nestedContainer(keyedBy: DateAndAgeKeys.self, forKey: .dob)
    dob = try container.decode(DateAndAge.self, forKey: .dob)
    dob.date = try dobContainer.decode(String.self, forKey: .date)
    dob.age = try dobContainer.decode(Int.self, forKey: .age)
    
    let registeredContainer = try container.nestedContainer(keyedBy: DateAndAgeKeys.self, forKey: .registered)
    registered = try container.decode(DateAndAge.self, forKey: .registered)
    registered.date = try registeredContainer.decode(String.self, forKey: .date)
    registered.age = try registeredContainer.decode(Int.self, forKey: .age)
    
    phone = try container.decode(String.self, forKey: .phone)
    cell = try container.decode(String.self, forKey: .cell)
    
    let idContainer = try container.nestedContainer(keyedBy: IDKeys.self, forKey: .id)
    id = try container.decode(Id.self, forKey: .id)
    id.name = try idContainer.decode(String.self, forKey: .name)
    id.value = try idContainer.decode(String.self, forKey: .value)
    
    let pictureContainer = try container.nestedContainer(keyedBy: PictureKeys.self, forKey: .picture)
    picture = try container.decode(Picture.self, forKey: .picture)
    picture.large = try pictureContainer.decode(String.self, forKey: .large)
    picture.medium = try pictureContainer.decode(String.self, forKey: .medium)
    picture.thumbnail = try pictureContainer.decode(String.self, forKey: .thumbnail)
    
    nat = try container.decode(String.self, forKey: .nat)
  }
}

struct Info: Codable {
  var seed: String
  var results: Int
  var page: Int
  var version: String
}
