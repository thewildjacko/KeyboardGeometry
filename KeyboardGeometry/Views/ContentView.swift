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
    GeometryReader { outerGeo in
      GeometryReader { geometry in
        Keyboard(geometry: geometry, size: size, initialKey: .C, octaves: 2)
      }
      .frame(width: outerGeo.size.width * 0.4, height: outerGeo.size.width * 0.4 * 91/(outerGeo.size.width * 0.4))
      .offset(x:outerGeo.size.width * 0.05, y: outerGeo.size.height * 0.1)
      
      GeometryReader { geometry in
        Keyboard(geometry: geometry, size: size, initialKey: .C, octaves: 2)
      }
      .frame(width: outerGeo.size.width * 0.4, height: outerGeo.size.width * 0.4 * 91/(outerGeo.size.width * 0.4))
      .offset(x:outerGeo.size.width * 0.55, y: outerGeo.size.height * 0.1)
      
      
      GeometryReader { geometry in
        Keyboard(geometry: geometry, size: size, initialKey: .C, octaves: 3)
      }
      .frame(width: outerGeo.size.width * 0.9, height: outerGeo.size.width * 0.9 * 91/(outerGeo.size.width * 0.9))
      .offset(x:outerGeo.size.width * 0.05, y: outerGeo.size.height / 2)
    }
    
//        .frame(width: Width.octave.rawValue * size)
    .border(Color.black, width: 1)
    .padding()
  }
}

#Preview {
  ContentView()
}
