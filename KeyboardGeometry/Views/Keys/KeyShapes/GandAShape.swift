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
//      let width = Width.whiteKeyCEGA.rawValue
//      let height = Height.whiteKey.rawValue
      
      let bWidth = Width.blackKey.rawValue * widthMultiplier
      let bHeight = bWidth *  Height.blackKey.rawValue/Width.blackKey.rawValue
//      let radius = Radius.whiteKey.rawValue
      
      let x0 = AddendMod.Gb.rawValue * widthMultiplier
      let x1 = x0 + bWidth - widthMultiplier
      let x2 = width
      let x3 = radius
      
      let y1 = bHeight
      let y2 = height - radius * 2
      
      let arcCenter1 = CGPoint(x: x2 - radius, y: height - radius)
      let arcCenter2 = CGPoint(x: radius, y: height - radius)
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

      path.addLine(to: CGPoint(x: x3, y: height))

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
