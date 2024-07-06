//
//  Keyboard.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

struct Keyboard: View {
  var geometry: GeometryProxy
  var size: CGFloat
  var keyCount: Int?
  var initialKey: KeyType = .C
  var keyTypes: [KeyType] = []
  var octaves: Int?
  var keys: [Key] = []
  var widthMod: CGFloat = 0
  var keyOffset: CGFloat = 0
  
  init(geometry: GeometryProxy, size: CGFloat, keyCount: Int? = nil, initialKey: KeyType = .C, octaves: Int? = 1) {
    self.geometry = geometry
    self.size = size
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
    
    for (index, type) in keyTypes.enumerated() {
      if index == 0 {
//        print("widthMod: \(widthMod)")
        keys.append(Key(type, geometry: geometry, size: size, widthMod: widthMod, initialKey: true, keyOffset: 0))
        keyOffset += type.nextKeyOffset
//        print("nextKeyOffset: \(type.nextKeyOffset)")
      } else {
        keys.append(Key(type, geometry: geometry, size: size, widthMod: widthMod, keyOffset: keyOffset))
        keyOffset += type.nextKeyOffset
//        print("nextKeyOffset: \(type.nextKeyOffset)")
      }
    }
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
      
//      let keyNames = keyTypes.map { $0.rawValue }
//      print(keyNames)
    }
  }
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      ForEach(keys) { key in
        key
      }
    }
  }
  //    .position(x: geometry.size.width/2, y: geometry.size.height/2)
}
