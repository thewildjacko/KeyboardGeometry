//
//  KeyboardKeys.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import Foundation
import SwiftUI

protocol KeyboardKeys {
  var geometry: GeometryProxy { get set }
  var width: CGFloat { get }
  var height: CGFloat { get }
  var radius: CGFloat { get set }
}
