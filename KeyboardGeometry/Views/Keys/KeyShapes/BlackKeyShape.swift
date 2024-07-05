//
//  BlackKeyShape.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct BlackKeyShape: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      let rect = CGRect(x: 0, y: 0, width: 14, height: 52)
      let cornerSize: CGFloat = 1.2
      
      path.addRoundedRect(in: rect, cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: cornerSize, bottomTrailing: cornerSize, topTrailing: 0))
    }
  }
}
