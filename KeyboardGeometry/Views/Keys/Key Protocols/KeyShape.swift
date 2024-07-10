//
//  KeyShape.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/7/24.
//

import Foundation
import SwiftUI

protocol KeyShape: Shape {
  var width: CGFloat  { get set }
  var height: CGFloat  { get set }
  var radius: CGFloat  { get set }
  var widthMultiplier: CGFloat  { get set }
}
