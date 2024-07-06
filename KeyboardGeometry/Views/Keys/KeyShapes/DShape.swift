//
//  DShape.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct DShape: Shape {
  var width: CGFloat
  var height: CGFloat
  var radius: CGFloat
  var widthMultiplier: CGFloat
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      let DbAddend = AddendMod.Db.rawValue * widthMultiplier
      let bWidth = Width.blackKey.rawValue * widthMultiplier
      let bHeight = bWidth *  Height.blackKey.rawValue/Width.blackKey.rawValue
      
      path.move(to: CGPoint(x: DbAddend, y: 0))
      
      path.addLines(
        [
          CGPoint(x: DbAddend, y: 0),
          CGPoint(x: DbAddend + bWidth, y: 0),
          CGPoint(x: DbAddend + bWidth, y: bHeight),
          CGPoint(x: DbAddend * 2 + bWidth, y: bHeight),
          CGPoint(x: DbAddend * 2 + bWidth, y: height - radius * 2)
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
            
      path.addLine(to: CGPoint(x: 0, y: bHeight))
      path.addLine(to: CGPoint(x: DbAddend, y: bHeight))
      
      path.closeSubpath()
    }
  }
}

