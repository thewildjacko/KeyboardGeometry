//
//  BlackKeyOctave.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

struct BlackKeyOctave: View {
  var geometry: GeometryProxy
  var size: CGFloat
  var firstOctave: Bool
  var offset: CGFloat {
    firstOctave ? 0 : Offset.BlackKey.octave.rawValue
  }
  
  var body: some View {
    HStack {
      
    }
  }
}
