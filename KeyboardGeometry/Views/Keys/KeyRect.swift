//
//  KeyRect.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/3/24.
//

import SwiftUI

struct KeyRect: View {
  var width: CGFloat
  var height: CGFloat
  var radius: CGFloat
  var stroke: Color
  var fill: Color
  var lineWidth: CGFloat
  var offset: CGFloat
  var z_Index: Double = 0
  
    var body: some View {
      UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: radius, bottomTrailing: radius, topTrailing: 0), style: .continuous)
        .stroke(.black, lineWidth: lineWidth)
        .fill(fill)
        .frame(width: width, height: height)
        .zIndex(z_Index)
        .offset(x: offset)
    }
}

