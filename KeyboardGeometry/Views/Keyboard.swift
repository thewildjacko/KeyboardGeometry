//
//  Keyboard.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

struct Keyboard: View {
  @State var fWidth: CGFloat = 351
  @State var height: CGFloat = 0
  @State var geoWidth: CGFloat
  var keyCount: Int?
  var initialKey: KeyType = .C
  var keyTypes: [KeyType] = []
  var octaves: Int?
  var keys: [Key] = []
  var widthMod: CGFloat = 0
  var keyPosition: CGFloat = 0
  var widthMultiplier: CGFloat = 0
  
  init(geoWidth: CGFloat, keyCount: Int? = nil, initialKey: KeyType = .C, octaves: Int? = 1) {
    self.geoWidth = geoWidth
    
    self.initialKey = initialKey
    self.keyTypes.append(initialKey)
    self.octaves = octaves
    
    var nextKey = initialKey.nextKey
    
    if let count = keyCount {
      self.keyCount = count
      if count != 0 {
        if count == 1 {
          ()
        } else {
          addKeys(count: count - 1, nextKey: &nextKey)
        }
      } else {
        addKeys(count: 12, nextKey: &nextKey)
      }
    } else {
      if let octaveCount = octaves {
        if octaveCount != 0 {
          addKeys(count: octaveCount * 12, nextKey: &nextKey)
        } else {
          addKeys(count: 12, nextKey: &nextKey)
        }
      } else {
        addKeys(count: 11, nextKey: &nextKey)
      }
    }
    
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
    
    for (index, type) in keyTypes.enumerated() {
      if index == 0 {
        keys.append(
          Key(
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
            type,
            octave: index <= 11 ? 0 : 1,
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
  
  func stats() {
    let key = keys[0]
    print("height: \(key.height)")
  }
  
  mutating func addKeys(count: Int, nextKey: inout KeyType) {
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
  
  mutating func resize(geoWidth: CGFloat) -> Keyboard{
    return Keyboard(geoWidth: geoWidth, keyCount: keyCount, initialKey: initialKey, octaves: octaves)
  }
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      VStack(alignment: .center) {
        Text("Title")
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
