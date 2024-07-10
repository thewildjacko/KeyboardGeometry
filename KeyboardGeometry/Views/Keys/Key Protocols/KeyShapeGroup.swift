//
//  KeyShapeGroup.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/9/24.
//

import Foundation
import SwiftUI

protocol KeyShapeGroup {
  associatedtype NoteShape where NoteShape: Shape
  var initialKey: Bool { get set }
  var keyShape: NoteShape { get }
  var keyRect: CGRect { get }
  var width: CGFloat { get set }
  var height: CGFloat { get set }
  var radius: CGFloat { get set }
  var widthMultiplier: CGFloat { get set }
  var fill: Color { get set }
  var stroke: Color { get set }
  var lineWidth: CGFloat { get set }
  var z_Index: Double { get set }
}

extension KeyShapeGroup {
  var keyRect: CGRect { CGRect(x: 0, y: 0, width: width, height: height) }
}
