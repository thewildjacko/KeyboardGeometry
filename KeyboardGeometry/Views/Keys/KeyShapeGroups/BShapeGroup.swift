//
//  BShapeGroup.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/7/24.
//

import SwiftUI

struct BShapeGroup: View, KeyShapeGroup {
  var initialKey: Bool = false
  typealias NoteShape = FandBShape
  var keyShape: FandBShape { FandBShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier)
  }
  
  var width: CGFloat
  var height: CGFloat
  var radius: CGFloat
  var widthMultiplier: CGFloat
  var position: CGFloat
  var fill: Color
  var stroke: Color
  var lineWidth: CGFloat
  var z_Index: Double
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      keyShape.path(
        in: keyRect)
      .fill(fill)
      
      keyShape.path(
        in: keyRect)
      .stroke(stroke, lineWidth: lineWidth)
    }
    .rotation3DEffect(
      .degrees(180),
      axis: (x: 0.0, y: 1.0, z: 0.0)
    )
    .frame(width: width, height: height)
    .zIndex(z_Index)
    .position(x: position, y: height/2)

  }
}

#Preview {
  BShapeGroup(width: 24, height: 96, radius: 2.5, widthMultiplier: 1, position: 0, fill: .white, stroke: .black, lineWidth: 1, z_Index: 0)
}
