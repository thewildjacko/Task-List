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

struct Street: Codable {
  var number: Int
  var name: String
}

struct Coordinates: Codable {
  var latitude: String
  var longitude: String
}

struct Timezone: Codable {
  var offset: String
  var description: String
}

struct Location: Encodable {
  var street: Street
  var city: String
  var state: String
  var country: String
  var postcode: Int
  var coordinates: Coordinates
  var timezone: Timezone
  
  enum CodingKeys: CodingKey {
    case street, city, state, country, postcode, coordinates, timezone
  }
  
  enum StreetKeys: CodingKey {
    case number, name
  }
  
  enum CoordinatesKeys: CodingKey {
    case latitude, longitude
  }
  
  enum TimezoneKeys: CodingKey {
    case offset, description
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    var streetContainer = container.nestedContainer(keyedBy: StreetKeys.self, forKey: .street)
    var coordinatesContainer = container.nestedContainer(keyedBy: CoordinatesKeys.self, forKey: .coordinates)
    var timezoneContainer = container.nestedContainer(keyedBy: TimezoneKeys.self, forKey: .timezone)
    
    try streetContainer.encode(street.number, forKey: .number)
    try streetContainer.encode(street.name, forKey: .name)

    try container.encode(city, forKey: .city)
    try container.encode(state, forKey: .state)
    try container.encode(country, forKey: .country)
    try container.encode(postcode, forKey: .postcode)
    
    try coordinatesContainer.encode(coordinates.latitude, forKey: .latitude)
    try coordinatesContainer.encode(coordinates.longitude, forKey: .longitude)
    
    try timezoneContainer.encode(timezone.offset, forKey: .offset)
    try timezoneContainer.encode(timezone.description, forKey: .description)
  }
}

extension Location: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    let streetContainer = try container.nestedContainer(keyedBy: StreetKeys.self, forKey: .street)
    street = try container.decode(Street.self, forKey: .street)
    street.number = try streetContainer.decode(Int.self, forKey: .number)
    street.name = try streetContainer.decode(String.self, forKey: .name)
    
    city = try container.decode(String.self, forKey: .city)
    state = try container.decode(String.self, forKey: .state)
    country = try container.decode(String.self, forKey: .country)
    postcode = try container.decode(Int.self, forKey: .postcode)
    
    let coordinatesContainer = try container.nestedContainer(keyedBy: CoordinatesKeys.self, forKey: .coordinates)
    coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
    coordinates.latitude = try coordinatesContainer.decode(String.self, forKey: .latitude)
    coordinates.longitude = try coordinatesContainer.decode(String.self, forKey: .longitude)
    
    let timezoneContainer = try container.nestedContainer(keyedBy: TimezoneKeys.self, forKey: .timezone)
    timezone = try container.decode(Timezone.self, forKey: .timezone)
    timezone.offset = try timezoneContainer.decode(String.self, forKey: .offset)
    timezone.description = try timezoneContainer.decode(String.self, forKey: .description)
  }
}

