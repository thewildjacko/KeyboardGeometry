//
//  FandBShape.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct FandBShape: Shape {
  var width: CGFloat
  var height: CGFloat
  var radius: CGFloat
  var widthMultiplier: CGFloat
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      let bWidth = Width.blackKey.rawValue * widthMultiplier
      let bHeight = bWidth * Constants.blackKeyHeightMultiplier
      
      path.addLines(
        [
          CGPoint(x: 0, y: 0),
          CGPoint(x: bWidth, y: 0),
          CGPoint(x: bWidth, y: bHeight),
          CGPoint(x: width, y: bHeight),
          CGPoint(x: width, y: height - radius * 2)
        ]
      )
      
      path.addRelativeArc(
        center: CGPoint(x: width - radius, y: height - radius),
        radius: radius,
        startAngle: Angle(degrees: 0),
        delta: Angle(degrees: 90.0)
      )
      
      path.addLine(to: CGPoint(x: radius, y: height))
      
      path.addRelativeArc(
        center: CGPoint(x: radius, y: height - radius),
        radius: radius,
        startAngle: Angle(degrees: 90),
        delta: Angle(degrees: 90.0)
      )
      
      path.closeSubpath()
    }
  }
}
