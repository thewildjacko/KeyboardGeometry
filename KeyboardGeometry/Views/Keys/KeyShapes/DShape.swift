//
//  DShape.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct DShape: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      let wWidth = Width.whiteKeyDFB.rawValue
      let DbAddend = AddendMod.Db.rawValue
      let wHeight = Height.whiteKey.rawValue
      let bWidth = Width.blackKey.rawValue
      let bHeight = Height.blackKey.rawValue
      let radius = Radius.whiteKey.rawValue
      
      path.move(to: CGPoint(x: DbAddend, y: 0))
      
      path.addLines(
        [
          CGPoint(x: DbAddend, y: 0),
          CGPoint(x: DbAddend + bWidth, y: 0),
          CGPoint(x: DbAddend + bWidth, y: bHeight),
          CGPoint(x: DbAddend * 2 + bWidth, y: bHeight),
          CGPoint(x: DbAddend * 2 + bWidth, y: wHeight - radius * 2)
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
            
      path.addLine(to: CGPoint(x: 0, y: bHeight))
      path.addLine(to: CGPoint(x: DbAddend, y: bHeight))
      
      path.closeSubpath()
    }
  }
}

