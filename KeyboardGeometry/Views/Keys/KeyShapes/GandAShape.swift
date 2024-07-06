//
//  GandAShape.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct GandAShape: Shape {
  var width: CGFloat
  var height: CGFloat
  var radius: CGFloat
  var widthMultiplier: CGFloat
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      let bWidth = Width.blackKey.rawValue * widthMultiplier
      
      let x0 = AddendMod.Gb.rawValue * widthMultiplier
      let x1 = x0 + bWidth - widthMultiplier
      let x2 = width
      let x3 = radius
      let x4 = 0.0
      
      let y0 = 0.0
      let y1 = bWidth *  Constants.blackKeyHeightMultiplier
      let y2 = height - radius * 2
      
      let arcCenter1 = CGPoint(x: x2 - radius, y: height - radius)
      let arcCenter2 = CGPoint(x: radius, y: height - radius)
      
      path.move(to: CGPoint(x: x0, y: y0))
      
      path.addLines(
        [
          CGPoint(x: x0, y: y0),
          CGPoint(x: x1, y: y0),
          CGPoint(x: x1, y: y1),
          CGPoint(x: x2, y: y1),
          CGPoint(x: x2, y: y2)
        ]
      )

      path.addRelativeArc(
        center: arcCenter1,
        radius: radius,
        startAngle: ArcAngle.one.angle,
        delta: ArcAngle.two.angle
      )

      path.addLine(to: CGPoint(x: x3, y: height))

      path.addRelativeArc(
        center: arcCenter2,
        radius: radius,
        startAngle: ArcAngle.two.angle,
        delta: ArcAngle.two.angle
      )
            
      path.addLine(to: CGPoint(x: x4, y: y1))
      path.addLine(to: CGPoint(x: x0, y: y1))
      
      path.closeSubpath()
    }
  }
}
