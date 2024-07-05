//
//  AdditionalOctave.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

struct AdditionalOctave: View, Identifiable {
  var id: UUID = UUID()
  
  var geometry: GeometryProxy
  var size: CGFloat

  var body: some View {
    ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
      AdditionalOctaveWhiteKeys(geometry: geometry, size: size)
      BlackKeyOctave(geometry: geometry, size: size, firstOctave: false)
    }
  }
}
