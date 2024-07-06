//
//  ContentView.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

struct ContentView: View {
  @State var size: CGFloat = 1
  
  var body: some View {
    GeometryReader { geometry in
//      Keyboard(geometry: geometry, size: size, octaves: 3)
      VStack {
        Keyboard(geometry: geometry, size: size, initialKey: .C, octaves: 1)
        Keyboard2(geometry: geometry, size: size, initialKey: .E, octaves: 1)
      }
//      Keyboard2(geometry: geometry, size: size, keyCount: 13, initialKey: .C, octaves: nil)
    }
    .frame(width: Width.octave.rawValue * size)
    .border(Color.black, width: 1)
    .padding()
  }
}

#Preview {
  ContentView()
}
