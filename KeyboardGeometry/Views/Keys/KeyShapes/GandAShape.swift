//
//  GandAShape.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct GandAShape: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      let wWidth = Width.whiteKeyCEGA.rawValue
      let wHeight = Height.whiteKey.rawValue
      
      let bWidth = Width.blackKey.rawValue
      let bHeight = Height.blackKey.rawValue
      let radius = Radius.whiteKey.rawValue
      
      let x0 = AddendMod.Gb.rawValue
      let x1 = x0 + bWidth - 1
      let x2 = wWidth
      let x3 = radius
      
      let y1 = bHeight
      let y2 = wHeight - radius * 2
      
      let arcCenter1 = CGPoint(x: x2 - radius, y: wHeight - radius)
      let arcCenter2 = CGPoint(x: radius, y: wHeight - radius)
      let arcAngle1 = Angle(degrees: 0)
      let arcAngle2 = Angle(degrees: 90.0)
      
      path.move(to: CGPoint(x: x0, y: 0))
      
      path.addLines(
        [
          CGPoint(x: x0, y: 0),
          CGPoint(x: x1, y: 0),
          CGPoint(x: x1, y: y1),
          CGPoint(x: x2, y: y1),
          CGPoint(x: x2, y: y2)
        ]
      )

      path.addRelativeArc(
        center: arcCenter1,
        radius: radius,
        startAngle: arcAngle1,
        delta: arcAngle2
      )

      path.addLine(to: CGPoint(x: x3, y: wHeight))

      path.addRelativeArc(
        center: arcCenter2,
        radius: radius,
        startAngle: arcAngle2,
        delta: arcAngle2
      )
            
      path.addLine(to: CGPoint(x: 0, y: y1))
      path.addLine(to: CGPoint(x: x0, y: y1))
      
      path.closeSubpath()
    }
  }
}
