//
//  BlackKeyOld.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

struct BlackKeyOld: View { // , KeyboardKeys
  var geometry: GeometryProxy
  var radius: CGFloat
  var type: BKType
  var octave: CGFloat

  var width: CGFloat { geometry.size.width * Width.blackKey.rawValue/Width.octave.rawValue }
  var height: CGFloat { width * Height.blackKey.rawValue/Width.blackKey.rawValue }
  
  var keyOffset: Offset.BlackKey {
    switch type {
    case .C_sh, .Db:
      return .Db
    case .D_sh, .Eb:
      return .Eb
    case .F_sh, .Gb:
      return .Gb
    case .G_sh, .Ab:
      return .Ab
    case .A_sh, .Bb:
      return .Bb
    }
  }
  var offset: CGFloat {
    geometry.size.width.getKeyOffset(offset: keyOffset, octave: octave)
  }
  
  var body: some View {
    KeyRect(width: width, height: height, radius: Radius.blackKey.rawValue * radius, stroke: .black, fill: .black, lineWidth: 1, offset: offset)
  }
}

extension BlackKeyOld {
  enum BKType {
    case Db
    case Eb
    case Gb
    case Ab
    case Bb
    case C_sh
    case D_sh
    case F_sh
    case G_sh
    case A_sh
  }
}
