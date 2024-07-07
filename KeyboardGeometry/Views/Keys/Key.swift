//
//  Key.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct Key: View, KeyProtocol, Identifiable {
  var id: UUID = UUID()
  
  var type: KeyType
  var octave: CGFloat = 0
  var geometry: GeometryProxy
  var widthMod: CGFloat
  var initialKey: Bool = false
  var keyOffset: CGFloat = 0
  var lineWidth: CGFloat = 1
  var stroke: Color = .black
  var fill: Color
  
  var body: some View {
    switch type {
    case .C:
      CShapeGroup(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier, offset: offset, fill: fill, stroke: stroke, lineWidth: lineWidth, z_Index: z_Index)
    case .D:
      DShapeGroup(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier, offset: offset, fill: fill, stroke: stroke, lineWidth: lineWidth, z_Index: z_Index)
      
    case .E:
      EShapeGroup(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier, offset: offset, fill: fill, stroke: stroke, lineWidth: lineWidth, z_Index: z_Index)
      
    case .F:
      FShapeGroup(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier, offset: offset, fill: fill, stroke: stroke, lineWidth: lineWidth, z_Index: z_Index)
    case .G:
      GShapeGroup(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier, offset: offset, fill: fill, stroke: stroke, lineWidth: lineWidth, z_Index: z_Index)
    case .A:
      AShapeGroup(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier, offset: offset, fill: fill, stroke: stroke, lineWidth: lineWidth, z_Index: z_Index)
    case .B:
      BShapeGroup(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier, offset: offset, fill: fill, stroke: stroke, lineWidth: lineWidth, z_Index: z_Index)
    case .Db, .Eb, .Gb, .Ab, .Bb:
      BlackKeyShapeGroup(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier, offset: offset, fill: fill, stroke: stroke, lineWidth: lineWidth, z_Index: z_Index)
    case .endingC, .endingE:
      EndingCandEShapeGroup(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier, offset: offset, fill: fill, stroke: stroke, lineWidth: lineWidth, z_Index: z_Index)
    }
  }
}

extension Key {
  init(type: KeyType = .C, geometry: GeometryProxy, widthMod: CGFloat, fill: Color, stroke: Color, lineWidth: CGFloat) {
    self.type = type
    self.geometry = geometry
    self.widthMod = widthMod
    self.fill = fill
    self.stroke = stroke
    self.lineWidth = lineWidth
  }
}

#Preview {
  GeometryReader { geometry in
    Key(type: .C, geometry: geometry, widthMod: 23, fill: .white)
  }
  .frame(width: 23 * 4, height: 96 * 4)
  .border(.black)
}
