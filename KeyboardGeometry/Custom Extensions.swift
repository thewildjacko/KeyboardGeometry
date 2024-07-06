//
//  Custom Extensions.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import Foundation

extension CGFloat {
  func getKeyOffset(offset: CGFloat, octave: CGFloat, widthMod: CGFloat) -> CGFloat {
    self * (offset + octave * Offset.octave.rawValue) / widthMod
  }
}
