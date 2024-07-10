//
//  ContentView.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/2/24.
//

import SwiftUI

protocol RotatableView: View {
  
}

struct ContentView: View {
  @State var portrait: Bool = true
  @State var geoSize: CGSize = .zero
  @State var kb1: Keyboard = Keyboard(title: "Base Chord", geoWidth: 351, initialKey: .C, octaves: 1)
  @State var kb2: Keyboard = Keyboard(title: "UST", geoWidth: 351, initialKey: .C, octaves: 1)
  @State var kb3: Keyboard = Keyboard(title: "Combined Chord", geoWidth: 351, initialKey: .C, octaves: 3)
  
  var body: some View {
    GeometryReader { geo in
      VStack(alignment: .center) {
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        HStack(spacing: 0) {
          VStack {
//            Text("Base Chord")
//              .font(.title)
//              .fontWeight(.heavy)
//              .foregroundStyle(.white)
            kb1
          }
          .padding()
          .frame(width: geoSize.width/2)
          .border(Color.black, width: 1)
          
          VStack {
//            Text("UST")
//              .font(.title)
//              .fontWeight(.heavy)
//              .foregroundStyle(.white)
            kb2
          }
          .padding()
          .frame(width: geoSize.width/2)
          .border(Color.black, width: 1)
        }
        Spacer()
        HStack {
          VStack {
//            Text("Combined Chord")
//              .font(.title)
//              .fontWeight(.heavy)
//              .foregroundStyle(.white)
            kb3
          }
          .padding()
        }
        Spacer()
        Spacer()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
      .onAppear(perform: {
        print("geo size: \(geo.size)")
      })
    }
    .background(
      GeometryReader { geo in
        Color.indigo
          .onAppear(perform: {
            print("background geoSize: \(geo.size)")
            geoSize = geo.size
            kb1 = kb1.resize(geoWidth: geo.size.width * 0.85 * 0.5)
            kb2 = kb2.resize(geoWidth: geo.size.width * 0.85 * 0.5)
            kb3 = kb3.resize(geoWidth: geo.size.width * 0.9)
          })
      }
    )
    .ignoresSafeArea(.all)
  }
}

#Preview {
  ContentView()
}
