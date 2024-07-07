//
//  AShapeGroup.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/7/24.
//

import SwiftUI

struct AShapeGroup: View, KeyShapeGroup {
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
      GandAShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
        in: CGRect(
          x: 0, y: 0,
          width: width, height: height
        ))
      .fill(fill)
      
      GandAShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
        in: CGRect(
          x: 0, y: 0,
          width: width, height: height
        ))
      .stroke(stroke, lineWidth: lineWidth)
    }
    .rotation3DEffect(
      .degrees(180),
      axis: (x: 0.0, y: 1.0, z: 0.0)
    )
    .frame(width: width, height: height)
    .zIndex(z_Index)
    .offset(x: offset)
  }
}

#Preview {
  AShapeGroup(width: 23, height: 96, radius: 2.5, widthMultiplier: 1, offset: 0, keyShape: GandAShape(width: 23, height: 96, radius: 2.5, widthMultiplier: 1), fill: .white, stroke: .black, lineWidth: 1, z_Index: 0)
}