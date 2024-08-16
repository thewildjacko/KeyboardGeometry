//
//  FShapeGroup.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/7/24.
//

import SwiftUI

struct FShapeGroup: View, KeyShapeGroup {
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
    .frame(width: width, height: height)
    .zIndex(z_Index)
    .position(x: position, y: height/2)

  }
}

#Preview {
  FShapeGroup(width: 24, height: 96, radius: 2.5, widthMultiplier: 1, position: 200, fill: .white, stroke: .black, lineWidth: 1, z_Index: 0)
}
