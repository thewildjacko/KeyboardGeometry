//
//  DShapeGroup.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/7/24.
//

import SwiftUI

struct DShapeGroup: View, KeyShapeGroup {
  var width: CGFloat
  var height: CGFloat
  var radius: CGFloat
  var widthMultiplier: CGFloat
  var offset: CGFloat
  var keyShape: KeyShape
  var fill: Color
  var stroke: Color
  var lineWidth: CGFloat
  var z_Index: Double
  
  var body: some View {
    ZStack {
      DShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
        in: CGRect(
          x: 0, y: 0,
          width: width, height: height
        ))
      .fill(fill)
      
      DShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
        in: CGRect(
          x: 0, y: 0,
          width: width, height: height
        ))
      .stroke(stroke, lineWidth: lineWidth)
    }
    .frame(width: width, height: height)
    .zIndex(z_Index)
    .offset(x: offset)
  }
}

#Preview {
  DShapeGroup(width: 24, height: 96, radius: 2.5, widthMultiplier: 1, offset: 0, keyShape: DShape(width: 24, height: 96, radius: 2.5, widthMultiplier: 1), fill: .white, stroke: .black, lineWidth: 1, z_Index: 0)
}
