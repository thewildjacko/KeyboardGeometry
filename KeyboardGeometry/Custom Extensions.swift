//
//  Custom Extensions.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import Foundation

extension CGFloat {
  func getKeyOffset(offset: Offset.BlackKey, octave: CGFloat) -> CGFloat {
    self * (offset.rawValue + octave * Offset.octave.rawValue) / Width.octave.rawValue
  }
  
  func getKeyOffset(offset: Offset.WhiteKey, octave: CGFloat) -> CGFloat {
    self * (offset.rawValue + octave * Offset.octave.rawValue) / Width.octave.rawValue
  }
  
  func getKeyOffset(offset: CGFloat, octave: CGFloat, widthMod: CGFloat) -> CGFloat {
    self * (offset + octave * Offset.octave.rawValue) / widthMod
  }
}
