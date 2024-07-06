//
//  CKey.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct CKey: View {
  var id: UUID = UUID()
  
  var type: KeyType { .C }
  var octave: CGFloat = 0
  var geometry: GeometryProxy
  var size: CGFloat
  var widthMod: CGFloat
  var initialKey: Bool = false
  var keyOffset: CGFloat = 0
  
  var body: some View {
    ZStack {
      EndingCandEShape(width: 23.0, height: 96.0, radius: 2.5, widthMultiplier: 1).path(
        in: CGRect(
          x: 0, y: 0,
          width: 23.0, height: 96.0
        ))
      .fill(.clear)
      
      EndingCandEShape(width: 23.0, height: 96.0, radius: 2.5, widthMultiplier: 1).path(
        in: CGRect(
          x: 0, y: 0,
          width: 23.0, height: 96.0
        ))
      .stroke(lineWidth: 1)
    }
    .frame(width: 23.0, height: 96.0)
  }
}

extension CKey {
  init(_ type: KeyType = .C, geometry: GeometryProxy, size: CGFloat, widthMod: CGFloat) {
    self.geometry = geometry
    self.size = size
    self.widthMod = widthMod
  }
}

#Preview {
  GeometryReader { geometry in
    CKey(geometry: geometry, size: 2, widthMod: 23)
  }
  .frame(width: Width.octave.rawValue * 2)
}
