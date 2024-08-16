//
//  Keyboard.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

enum KeyboardID {
  case one, two, three
}

struct Keyboard: View, Identifiable {
  var id: KeyboardID
  //  MARK: @State properties
  @State var fWidth: CGFloat = 351
  @State var height: CGFloat = 0
  @State var geoWidth: CGFloat
  var title: String
  
  //  MARK: instance properties
  
  var keyCount: Int?
  var initialKey: KeyType = .C
  var keyTypes: [KeyType] = []
  var octaves: Int?
  var keys: [Key] = []
  var widthMod: CGFloat = 0
  var keyPosition: CGFloat = 0
  var widthMultiplier: CGFloat = 0
  
  //  MARK: initializers
  init(id: KeyboardID = .one, title: String, geoWidth: CGFloat, keyCount: Int? = nil, initialKey: KeyType = .C, octaves: Int? = 1) {
    self.id = id
    self.title = title
    self.geoWidth = geoWidth
    
    self.initialKey = initialKey
    self.keyTypes.append(initialKey)
    self.octaves = octaves
    
    keyTypesByCount()
    setWidthAndHeight()
    addKeys()
  }
  
  //  MARK: initializer methods
  mutating func keyTypesByCount() {
    var nextKey = initialKey.nextKey
    
    if let count = keyCount {
      self.keyCount = count
      if count != 0 {
        if count == 1 {
          ()
        } else {
          addKeyTypes(count: count - 1, nextKey: &nextKey)
        }
      } else {
        addKeyTypes(count: 12, nextKey: &nextKey)
      }
    } else {
      if let octaveCount = octaves {
        if octaveCount != 0 {
          addKeyTypes(count: octaveCount * 12, nextKey: &nextKey)
        } else {
          addKeyTypes(count: 12, nextKey: &nextKey)
        }
      } else {
        addKeyTypes(count: 11, nextKey: &nextKey)
      }
    }
  }
  
  mutating func setWidthAndHeight() {
    for (index, type) in keyTypes.enumerated() {
      switch type {
      case .C, .E, .G, .A, .endingC, .endingE:
        widthMod += index == 0 ? Width.whiteKeyCEGA.rawValue : Width.getAddend(type)
      case .D, .F, .B:
        widthMod += index == 0 ? Width.whiteKeyDFB.rawValue : Width.getAddend(type)
      case .Db, .Eb, .Gb, .Ab, .Bb:
        widthMod += index == 0 ? Width.blackKey.rawValue : Width.getAddend(type)
      }
    }
    
    widthMultiplier = geoWidth/widthMod
    height = Height.whiteKey.rawValue * widthMultiplier
  }
  
  mutating func addKeyTypes(count: Int, nextKey: inout KeyType) {
    for i in 1...count {
      if i == count && (nextKey == .C || nextKey == .E)  {
        nextKey == .C ? keyTypes.append(.endingC) : keyTypes.append(.endingE)
        nextKey = nextKey.nextKey
      } else {
        keyTypes.append(nextKey)
        nextKey = nextKey.nextKey
      }
    }
  }
  
  mutating func setFill(type: KeyType) -> Color {
    switch type {
    case .C, .D, .E, .F, .G, .A, .B, .endingC, .endingE:
      return .white
    case .Db, .Eb, .Gb, .Ab, .Bb:
      return .black
    }
  }
  
  mutating func addKeys() {
    for (index, type) in keyTypes.enumerated() {
      if index == 0 {
        keys.append(
          Key(
            keyboardKeyID: "\(id)_\(index)",
            type,
            geoWidth: geoWidth,
            widthMod: widthMod,
            fill: setFill(type: type),
            stroke: .black,
            initialKey: true,
            keyPosition: type.initialKeyPosition)
        )
        keyPosition += type.initialKeyPosition + type.nextKeyPosition
      } else {
        keys.append(
          Key(
            keyboardKeyID: "\(id)_\(index)",
            type,
            octaveInKeyboard: index <= 11 ? 0 : 1,
            geoWidth: geoWidth,
            widthMod: widthMod,
            fill: setFill(type: type),
            stroke: .black,
            keyPosition: keyPosition)
        )
        keyPosition += type.nextKeyPosition
      }
    }
  }
  
  //  MARK: instance methods
  func stats() {
    let key = keys[0]
    print("height: \(key.height)")
  }
  
  mutating func resize(geoWidth: CGFloat) -> Keyboard{
    return Keyboard(id: id, title: title, geoWidth: geoWidth, keyCount: keyCount, initialKey: initialKey, octaves: octaves)
  }
  
  mutating func highlightKeys() {
    let degs = [0, 4, 7]
    
    for deg in degs {
      if let index = keys.firstIndex(where: { $0.keyboardKeyID == "\(id)_\(deg)" }) {
        keys[index].fill = .red
      }
    }
  }
  
  //  MARK: body
  var body: some View {
    ZStack(alignment: .topLeading) {
      VStack(alignment: .center) {
        Text(title)
          .font(.title)
          .fontWeight(.heavy)
          .foregroundStyle(.white)
        ZStack {
          ForEach(keys) { key in
            key
          }
        }
        .frame(width: geoWidth, height: height)
        .position(x: geoWidth/2)
      }
    }
  }
}

#Preview {
  VStack {
    Keyboard(title: "Combined Chord", geoWidth: 351, initialKey: .C, octaves: 3)
      .position(x: 220, y: 600)
  }
}


