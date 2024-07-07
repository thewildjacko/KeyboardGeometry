//
//  BlackKeyShapeGroup.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/7/24.
//

import SwiftUI

struct BlackKeyShapeGroup: View, KeyShapeGroup {
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
      BlackKeyShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
        in: CGRect(
          x: 0, y: 0,
          width: width, height: height
        ))
      .fill(fill)
      
      BlackKeyShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
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
  BlackKeyShapeGroup(width: 14, height: 52, radius: 1.2, widthMultiplier: 1, offset: 0, keyShape: BlackKeyShape(width: 14, height: 52, radius: 1.2, widthMultiplier: 1), fill: .black, stroke: .black, lineWidth: 1, z_Index: 1)
}
