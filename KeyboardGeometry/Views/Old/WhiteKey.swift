//
//  WhiteKey.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/3/24.
//

import SwiftUI

struct WhiteKey: View { // , KeyboardKeys 
  var geometry: GeometryProxy
  var radius: CGFloat
  var type: WKType
  var octave: CGFloat

  var width: CGFloat {
    switch type {
    case .C, .E, .G, .A:
      return geometry.size.width * Width.whiteKeyCEGA.rawValue/Width.octave.rawValue
    case .D, .F, .B:
      return geometry.size.width * Width.whiteKeyDFB.rawValue/Width.octave.rawValue
    }
  }
  
  var height: CGFloat { 
    switch type {
    case .C, .E, .G, .A:
      return width * Height.whiteKey.rawValue/Width.whiteKeyCEGA.rawValue
    case .D, .F, .B:
      return width * Height.whiteKey.rawValue/Width.whiteKeyDFB.rawValue
    }
  }

  var keyOffset: Offset.WhiteKey {
    switch type {
    case .C:
      return .C
    case .D:
      return .D
    case .E:
      return .E
    case .F:
      return .F
    case .G:
      return .G
    case .A:
      return .A
    case .B:
      return .B
    }
  }
  var offset: CGFloat {
    geometry.size.width.getKeyOffset(offset: keyOffset, octave: octave)
  }
  
  var body: some View {
    KeyRect(width: width, height: height, radius: Radius.whiteKey.rawValue * radius, stroke: .black, fill: .clear, lineWidth: 1, offset: offset)
  }
}

extension WhiteKey {
  enum WKType {
    case C
    case D
    case E
    case F
    case G
    case A
    case B
  }
}
