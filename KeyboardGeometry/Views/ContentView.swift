//
//  ContentView.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

struct ContentView: View {
  @State var size1: CGSize = .zero
  @State var size2: CGSize = .zero
  
  var body: some View {
    GeometryReader { outerGeo in
      GeometryReader { geometry in
        Keyboard(geometry: geometry, initialKey: .C, octaves: 1)
      }
      .saveSize(in: $size1)
      .frame(width: outerGeo.size.width * 0.4, height: size1.height)
      .border(Color.black, width: 1)
      .offset(x:outerGeo.size.width * 0.05, y: outerGeo.size.height * 0.1)
      .onAppear(perform: {
        print(size1)
      })
      
      GeometryReader { geometry in
        Keyboard(geometry: geometry, initialKey: .C, octaves: 1)
      }
      .frame(width: outerGeo.size.width * 0.4, height: size1.height)
      .border(Color.black, width: 1)
      .offset(x:outerGeo.size.width * 0.55, y: outerGeo.size.height * 0.1)
      
      
      GeometryReader { geometry in
        Keyboard(geometry: geometry, initialKey: .C, octaves: 3)
      }
      .frame(width: outerGeo.size.width * 0.9, height: size2.height)
      
      .border(Color.black, width: 1)
      .offset(x:outerGeo.size.width * 0.05, y: outerGeo.size.height / 2)
    }
//    .border(Color.black, width: 1)
    .padding()
  }
}

#Preview {
  ContentView()
}
