//
//  Octave.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/3/24.
//

import SwiftUI

struct Octave: View {
  var geometry: GeometryProxy
  var size: CGFloat
  var initialKey: KeyType = .C
  var keyTypes: [KeyType]
  var keys: [Key] = []
  var widthMod: CGFloat = 0
  var keyOffset: CGFloat = 0
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      ForEach(keys) { key in
        key
      }
    }
  }
  
  init(geometry: GeometryProxy, size: CGFloat, initialKey: KeyType = .C, keyTypes: [KeyType]) {
    self.geometry = geometry
    self.size = size
    self.initialKey = initialKey
    self.keyTypes = keyTypes
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
        print("widthMod: \(widthMod)")
        keys.append(Key(type, octave: 0, geometry: geometry, size: size, widthMod: widthMod, initialKey: true, keyOffset: 0))
        keyOffset += type.nextKeyOffset
        print("nextKeyOffset: \(type.nextKeyOffset)")
      } else {
        keys.append(Key(type, octave: 0, geometry: geometry, size: size, widthMod: widthMod, keyOffset: keyOffset))
        keyOffset += type.nextKeyOffset
        print("nextKeyOffset: \(type.nextKeyOffset)")
      }
    }
  }
}
