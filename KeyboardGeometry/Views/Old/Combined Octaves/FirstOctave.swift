//
//  FirstOctave.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

struct FirstOctave: View {
  var geometry: GeometryProxy
  var size: CGFloat
  
  var body: some View {
    ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
      FirstOctaveWhiteKeys(geometry: geometry, size: size)
      BlackKeyOctave(geometry: geometry, size: size, firstOctave: true)
    }
  }
}
