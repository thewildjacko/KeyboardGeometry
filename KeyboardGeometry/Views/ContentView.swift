//
//  ContentView.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

struct ContentView: View {
  @State var size: CGFloat = 2
  
  var body: some View {
    GeometryReader { geometry in
//      Keyboard(geometry: geometry, size: size, octaves: 3)
      Keyboard(geometry: geometry, size: size, initialKey: .C, octaves: 3)
    }
    .frame(width: Width.octave.rawValue * size)
    .border(Color.black, width: 1)
    .padding()
  }
}

#Preview {
  ContentView()
}
