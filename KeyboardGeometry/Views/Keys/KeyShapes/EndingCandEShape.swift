//
//  EndingCandEShape.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct EndingCandEShape: Shape {
  var width: CGFloat
  var height: CGFloat
  var radius: CGFloat
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.addLines(
        [
          CGPoint(x: 0, y: 0),
          CGPoint(x: width, y: 0),
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
