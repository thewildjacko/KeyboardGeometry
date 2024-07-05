//
//  CKey.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct CKey: View {
  let width = Width.whiteKeyCEGA.rawValue
  let height = Height.whiteKey.rawValue
  
  var body: some View {
    ZStack {
      CandEShape().path(
        in: CGRect(
          x: 0, y: 0,
          width: width, height: height
        ))
      .fill(.clear)
      
      CandEShape().path(
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
  HStack(spacing:0) {
    CKey()
  }
}
