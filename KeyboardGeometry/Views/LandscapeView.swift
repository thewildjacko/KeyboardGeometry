//
//  LandscapeView.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/10/24.
//

import SwiftUI

struct LandscapeView: View, RotatableView {
  var geoWidth: CGFloat
  @State var kb1: Keyboard = Keyboard(title: "", geoWidth: 351, initialKey: .C, octaves: 1)
  @State var kb2: Keyboard = Keyboard(title: "", geoWidth: 351, initialKey: .C, octaves: 1)
  @State var kb3: Keyboard = Keyboard(title: "", geoWidth: 351, initialKey: .C, octaves: 3)
  
  var body: some View {
    VStack(alignment: .center, spacing: 5) {
      HStack(spacing: 100) {
        VStack(spacing: 10) {
          Text("Base Chord")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(.white)
          kb1
        }
        VStack(spacing: 10) {            Text("UST")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(.white)
          kb2
        }
      }
      Spacer()
      Spacer()
      HStack {
        VStack(spacing: 10) {
          Text("Combined Chord")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(.white)
          kb3
        }
      }
      Spacer()
      Spacer()
      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    .background(
      GeometryReader { geo in
        Color.indigo
          .onAppear(perform: {
//            print("background geoSize: \(geo.size)")
//            geoSize = geo.size
            kb1 = kb1.resize(geoWidth: geo.size.width * 0.85 * 0.5 * 0.5)
            kb2 = kb2.resize(geoWidth: geo.size.width * 0.85 * 0.5 * 0.5)
            kb3 = kb3.resize(geoWidth: geo.size.width * 0.9)
          })
      }
    )
  }
}

#Preview {
  LandscapeView(geoWidth: 351 * 2, kb1: Keyboard(title: "", geoWidth: 351 * 2), kb2: Keyboard(title: "", geoWidth: 351), kb3: Keyboard(title: "", geoWidth: 187, octaves: 3))
}
