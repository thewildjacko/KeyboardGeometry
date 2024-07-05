//
//  Key.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/3/24.
//

import SwiftUI

struct Key: View, Identifiable {
  var id: UUID = UUID()
  
  var type: KeyType
  var octave: CGFloat
  var octaveDivisor: CGFloat
  var geometry: GeometryProxy
  var size: CGFloat
  var widthMod: CGFloat
  var initialKey: Bool = false
  
  var radius: CGFloat {
    let geoWidth = geometry.size.width
    switch type {
    case .C, .D, .E, .F, .G, .A, .B:
      return Radius.whiteKey.rawValue * geoWidth / widthMod
    case .Db, .Eb, .Gb, .Ab, .Bb:
      return Radius.blackKey.rawValue * geoWidth / widthMod
    }
  }
  
  var fill: Color {
    switch type {
    case .C, .D, .E, .F, .G, .A, .B:
      return .clear
    case .Db, .Eb, .Gb, .Ab, .Bb:
      return .black
    }
  }
  
  var z_Index: Double {
    switch type {
    case .C, .D, .E, .F, .G, .A, .B:
      return 0
    case .Db, .Eb, .Gb, .Ab, .Bb:
      return 1.0
    }
  }
  
  var width: CGFloat {
    let geoWidth = geometry.size.width
    
//    print("geoWidth: \(geoWidth), keyboardWidth: \(keyboardWidth)")
    
    switch type {
    case .C, .E, .G, .A:
//      print(type, widthMod, Width.whiteKeyCEGA.rawValue * geoWidth / widthMod)
      return Width.whiteKeyCEGA.rawValue * geoWidth / widthMod
    case .D, .F, .B:
//      print(type, widthMod, Width.whiteKeyDFB.rawValue * geoWidth / widthMod)
      return Width.whiteKeyDFB.rawValue * geoWidth / widthMod
    case .Db, .Eb, .Gb, .Ab, .Bb:
//      print(type, widthMod, Width.blackKey.rawValue * geoWidth / widthMod)
      return Width.blackKey.rawValue * geoWidth / widthMod
    }
  }
  
  var height: CGFloat {
    switch type {
    case .C, .E, .G, .A:
      return width * Height.whiteKey.rawValue/Width.whiteKeyCEGA.rawValue
    case .D, .F, .B:
      return width * Height.whiteKey.rawValue/Width.whiteKeyDFB.rawValue
    case .Db, .Eb, .Gb, .Ab, .Bb:
      return width * Height.blackKey.rawValue/Width.blackKey.rawValue
    }
  }
  
  var KeyWidthAddend: CGFloat { Width.getAddend(type) }
  
  var keyOffset: CGFloat = 0
  
  var offset: CGFloat {
    (geometry.size.width / octaveDivisor).getKeyOffset(offset: keyOffset, octave: octave, widthMod: widthMod)
  }
  
  var body: some View {
    KeyRect(width: width, height: height, radius: radius, stroke: .black, fill: fill, lineWidth: 1, offset: offset, z_Index: z_Index)
  }
}

extension Key {
  enum KeyType {
    case C, D, E, F, G, A, B
    case Db, Eb, Gb, Ab, Bb
    
    var nextKeyOffset: CGFloat {
      switch self {
      case .C:
        return 14
      case .Db:
        return 9
      case .D:
        return 19
      case .Eb:
        return 5
      case .E:
        return 23
      case .F:
        return 13
      case .Gb:
        return 11
      case .G:
        return 16
      case .Ab:
        return 7
      case .A:
        return 20
      case .Bb:
        return 3
      case .B:
        return 24
      }
    }
    
    var nextKey: KeyType {
      switch self {
      case .C:
        return .Db
      case .Db:
        return .D
      case .D:
        return .Eb
      case .Eb:
        return .E
      case .E:
        return .F
      case .F:
        return .Gb
      case .Gb:
        return .G
      case .G:
        return .Ab
      case .Ab:
        return .A
      case .A:
        return .Bb
      case .Bb:
        return .B
      case .B:
        return .C
      }
    }
  }
  
  
  init(_ type: KeyType = .C, octave: CGFloat = 0, octaveDivisor: CGFloat = 1, geometry: GeometryProxy, size: CGFloat = 1, widthMod: CGFloat = 23, initialKey: Bool = false, keyOffset: CGFloat = 0) {
    self.type = type
    self.octave = octave
    self.octaveDivisor = octaveDivisor
    self.geometry = geometry
    self.size = size
    self.widthMod = widthMod
    self.initialKey = initialKey
    self.keyOffset = keyOffset
  }
}
