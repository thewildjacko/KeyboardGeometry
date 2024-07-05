//
//  CandEShape.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct CandEShape: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      let wWidth = Width.whiteKeyCEGA.rawValue
      let wHeight = Height.whiteKey.rawValue
      let bWidth = Width.blackKey.rawValue
      let bHeight = Height.blackKey.rawValue
      let radius = Radius.whiteKey.rawValue
      
      path.addLines(
        [
          CGPoint(x: 0, y: 0),
          CGPoint(x: bWidth, y: 0),
          CGPoint(x: bWidth, y: bHeight),
          CGPoint(x: wWidth, y: bHeight),
          CGPoint(x: wWidth, y: wHeight - radius * 2)
        ]
      )
      
      path.addRelativeArc(
        center: CGPoint(x: wWidth - radius, y: wHeight - radius),
        radius: radius,
        startAngle: Angle(degrees: 0),
        delta: Angle(degrees: 90.0)
      )
      
      path.addLine(to: CGPoint(x: radius, y: wHeight))
      
      path.addRelativeArc(
        center: CGPoint(x: radius, y: wHeight - radius),
        radius: radius,
        startAngle: Angle(degrees: 90),
        delta: Angle(degrees: 90.0)
      )
      
      path.closeSubpath()
    }
  }
}
