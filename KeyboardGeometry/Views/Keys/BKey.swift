//
//  BKey.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct BKey: View {
  let width = Width.whiteKeyDFB.rawValue
  let height = Height.whiteKey.rawValue
  
  var body: some View {
    ZStack {
      FandBShape().path(
        in: CGRect(
          x: 0, y: 0,
          width: width, height: height
        ))
      .fill(.clear)
      
      FandBShape().path(
        in: CGRect(
          x: 0, y: 0,
          width: width, height: height
        ))
      .stroke(lineWidth: 1)
    }
    .rotation3DEffect(
      .degrees(180),
      axis: (x: 0.0, y: 1.0, z: 0.0)
    )
    .frame(width: width, height: height)
  }
}

#Preview {
  BKey()
}
