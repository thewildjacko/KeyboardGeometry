//
//  BlackKeyShape.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct BlackKeyShape: Shape {
  var width: CGFloat
  var height: CGFloat
  var radius: CGFloat
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      let rect = CGRect(x: 0, y: 0, width: width, height: height)
//      let radius: CGFloat = 1.2
      
      path.addRoundedRect(in: rect, cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: radius, bottomTrailing: radius, topTrailing: 0))
    }
  }
}
