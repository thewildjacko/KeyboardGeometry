//
//  KeyShape.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/7/24.
//

import Foundation
import SwiftUI

protocol KeyShape {
  var width: CGFloat  { get set }
  var height: CGFloat  { get set }
  var radius: CGFloat  { get set }
  var widthMultiplier: CGFloat  { get set }
}

protocol KeyShapeGroup {
  var width: CGFloat { get set }
  var height: CGFloat { get set }
  var radius: CGFloat { get set }
  var widthMultiplier: CGFloat { get set }
  var keyShape: KeyShape { get set }
  var fill: Color { get set }
  var stroke: Color { get set }
  var lineWidth: CGFloat { get set }
  var z_Index: Double { get set }
}
