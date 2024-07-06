//
//  KeyboardKeys.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import Foundation
import SwiftUI

protocol KeyProtocol {
  var id: UUID { get set }
  
  var type: KeyType { get set }
  var octave: CGFloat { get set }
  var geometry: GeometryProxy { get set }
  var size: CGFloat { get set }
  var widthMod: CGFloat { get set }
  var initialKey: Bool { get set }
  var keyOffset: CGFloat { get set }
  
  var widthMultiplier: CGFloat { get }
  var radius: CGFloat { get }
  var width: CGFloat { get }
  var height: CGFloat { get }
  var fill: Color { get }
  var z_Index: Double { get }
  
  init(type: KeyType, geometry: GeometryProxy, size: CGFloat, widthMod: CGFloat)
}

extension KeyProtocol {
  var widthMultiplier: CGFloat { geometry.size.width / widthMod }
  
  var radius: CGFloat {
    switch type {
    case .C, .D, .E, .F, .G, .A, .B, .endingC, .endingE:
      return Radius.whiteKey.rawValue * widthMultiplier
    case .Db, .Eb, .Gb, .Ab, .Bb:
      return Radius.blackKey.rawValue * widthMultiplier
    }
  }
  
  var width: CGFloat {
    switch type {
    case .C, .E, .G, .A, .endingC, .endingE:
      return Width.whiteKeyCEGA.rawValue * widthMultiplier
    case .D, .F, .B:
      return Width.whiteKeyDFB.rawValue * widthMultiplier
    case .Db, .Eb, .Gb, .Ab, .Bb:
      return Width.blackKey.rawValue * widthMultiplier
    }
  }
  
  var height: CGFloat {
    switch type {
    case .C, .E, .G, .A, .endingC, .endingE:
      return width * Height.whiteKey.rawValue/Width.whiteKeyCEGA.rawValue
    case .D, .F, .B:
      return width * Height.whiteKey.rawValue/Width.whiteKeyDFB.rawValue
    case .Db, .Eb, .Gb, .Ab, .Bb:
      return width * Height.blackKey.rawValue/Width.blackKey.rawValue
    }
  }
  
  var fill: Color {
    switch type {
    case .C, .D, .E, .F, .G, .A, .B, .endingC, .endingE:
      return .clear
    case .Db, .Eb, .Gb, .Ab, .Bb:
      return .black
    }
  }
  
  var z_Index: Double {
    switch type {
    case .C, .D, .E, .F, .G, .A, .B, .endingC, .endingE:
      return 0
    case .Db, .Eb, .Gb, .Ab, .Bb:
      return 1.0
    }
  }
  
  var offset: CGFloat {
    geometry.size.width.getKeyOffset(offset: keyOffset, octave: octave, widthMod: widthMod)
  }
  
  var KeyWidthAddend: CGFloat { Width.getAddend(type) }
  
  init(_ type: KeyType = .C, octave: CGFloat = 0, geometry: GeometryProxy, size: CGFloat, widthMod: CGFloat = 23, initialKey: Bool = false, keyOffset: CGFloat = 0) {
    self.init(type: type, geometry: geometry, size: size, widthMod: widthMod)
    
    self.octave = octave
    self.initialKey = initialKey
    self.keyOffset = keyOffset
  }
}
