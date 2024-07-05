//
//  DKey.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct DKey: View {
  let width = Width.whiteKeyDFB.rawValue
  let height = Height.whiteKey.rawValue
  
  var body: some View {
    ZStack {
      DShape().path(
        in: CGRect(
          x: 0, y: 0,
          width: width, height: height
        ))
      .fill(.clear)
      
      DShape().path(
        in: CGRect(
          x: 0, y: 0,
          width: width, height: height
        ))
      .stroke(lineWidth: 1)
    }
    .frame(width: width, height: height)
  }
}

#Preview {
  DKey()
}
