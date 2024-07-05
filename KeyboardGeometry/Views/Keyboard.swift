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
        addKeys(count: count - 1, nextKey: &nextKey)
//        for _ in 1...(count - 1) {
//          keyTypes.append(nextKey)
//          nextKey = nextKey.nextKey
//        }
      } else {
        addKeys(count: 12, nextKey: &nextKey)
//        for _ in 1...(12) {
//          keyTypes.append(nextKey)
//          nextKey = nextKey.nextKey
//        }
      }
    } else {
      if let octaveCount = octaves {
        if octaveCount != 0 {
          addKeys(count: octaveCount * 12, nextKey: &nextKey)
//          for _ in 1...(octaveCount * 12) {
//            keyTypes.append(nextKey)
//            nextKey = nextKey.nextKey
//          }
        } else {
          addKeys(count: 12, nextKey: &nextKey)
//          for _ in 1...12 {
//            keyTypes.append(nextKey)
//            nextKey = nextKey.nextKey
//          }
        }
      } else {
        addKeys(count: 11, nextKey: &nextKey)
//        for _ in (1...11) {
//          keyTypes.append(nextKey)
//          nextKey = nextKey.nextKey
//        }
      }
    }
    
//    if octaves != 0 {
//      self.keyCount = keyCount * octaves
//    } else {
//      self.keyCount = keyCount
//    }
    
//    for _ in 1...(self.keyCount - 1) {
//      keyTypes.append(nextKey)
//      nextKey = nextKey.nextKey
//    }
//    
    
    
    for (index, type) in keyTypes.enumerated() {
      switch type {
      case .C, .E, .G, .A:
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
        keys.append(Key(type, octave: 0, octaveDivisor: 1, geometry: geometry, size: size, widthMod: widthMod, initialKey: true, keyOffset: 0))
        keyOffset += type.nextKeyOffset
//        print("nextKeyOffset: \(type.nextKeyOffset)")
      } else {
        keys.append(Key(type, octave: 0, octaveDivisor: 1, geometry: geometry, size: size, widthMod: widthMod, keyOffset: keyOffset))
        keyOffset += type.nextKeyOffset
//        print("nextKeyOffset: \(type.nextKeyOffset)")
      }
    }
  }
  
  mutating func addKeys(count: Int, nextKey: inout KeyType) {
    for _ in 1...(count) {
      keyTypes.append(nextKey)
      nextKey = nextKey.nextKey
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
