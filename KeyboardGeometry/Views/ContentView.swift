//
//  ContentView.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

struct ContentView: View {
  @State var screenSize: CGSize = .zero
  @State var kb1: Keyboard = Keyboard(geoWidth: 100.0, initialKey: .C, octaves: 1)
  @State var kb2: Keyboard = Keyboard(geoWidth: 100.0, initialKey: .C, octaves: 1)
  @State var kb3: Keyboard = Keyboard(geoWidth: 100.0, initialKey: .C, octaves: 3)
  
  var body: some View {
    GeometryReader { outerGeo in
        GeometryReader { innerGeo in
          kb1
            .frame(width: screenSize.width * 0.4, height: Height.whiteKey.rawValue)
            .position(x: innerGeo.size.width * 0.5, y: innerGeo.size.height*0.4)
        }
      .background(
        Color.indigo
      )
      .frame(width: screenSize.width * 0.5)
      .offset(x: 0, y: 0)
      
      GeometryReader { innerGeo in
        kb2
          .frame(width: screenSize.width * 0.4, height: Height.whiteKey.rawValue)
          .position(x: innerGeo.size.width * 0.5, y: innerGeo.size.height*0.4)
      }
      .background(
        Color.green
      )
      .frame(width: screenSize.width * 0.5)
      .offset(x: screenSize.width/2, y: 0)
      
      GeometryReader { innerGeo in
        kb3
          .frame(width: screenSize.width * 0.9, height: Height.whiteKey.rawValue)
          .position(x: screenSize.width * 0.525, y: innerGeo.size.height * 0.2)
      }
      .background(
        Color.red
      )
      .frame(width: screenSize.width)
      .offset(x: 0, y: screenSize.height/2)
      
    }
    .background(
      GeometryReader { geometry in
        Color.white
          .onAppear(perform: {
            screenSize = geometry.size
            kb1 = Keyboard(geoWidth: screenSize.width * 0.45, octaves: 1)
            kb2 = Keyboard(geoWidth: screenSize.width * 0.45, octaves: 1)
            kb3 = Keyboard(geoWidth: screenSize.width * 0.9, initialKey: .C, octaves: 3)
          })
          .onChange(of: geometry.size) {
            screenSize = geometry.size
            kb1 = Keyboard(geoWidth: screenSize.width * 0.45, octaves: 1)
            kb2 = Keyboard(geoWidth: screenSize.width * 0.45, octaves: 1)
            kb3 = Keyboard(geoWidth: screenSize.width * 0.9, initialKey: .C, octaves: 3)
          }
      }
        .ignoresSafeArea(.all)
    )
  }
}

#Preview {
  ContentView()
}
