//
//  Custom Extensions.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import Foundation
import SwiftUI

protocol Summable { static func +(lhs: Self, rhs: Self) -> Self }
protocol Subtractable { static func -(lhs: Self, rhs: Self) -> Self }
protocol Multiplicable { static func *(lhs: Self, rhs: Self) -> Self }
protocol Divisible { static func /(lhs: Self, rhs: Self) -> Self }

protocol Mathable: Summable, Subtractable, Multiplicable, Divisible { }

extension CGFloat {
  func getKeyPosition(position: CGFloat, widthMod: CGFloat) -> CGFloat {
    return self * position / widthMod
  }
}

// A View wrapper to make the modifier easier to use
// from https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-device-rotation
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

extension Int: Mathable {
  func toPitch(startingOctave: Int) -> Int {
    let type = KeyType(rawValue: self) ?? .C
    return type.pitchNumber + (startingOctave + 1) * 12
  }
}

extension Array where Element == Int {
  func highlightIfSelected(keys: inout [Key], color: Color) {
    for deg in self {
      if let index = keys.firstIndex(where: { $0.pitch == deg }) {
        keys[index].fill = color
      }
    }
  }
}
