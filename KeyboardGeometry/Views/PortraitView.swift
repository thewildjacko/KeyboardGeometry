//
//  PortraitView.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/10/24.
//

import SwiftUI

struct PortraitView: View {
  var geoWidth: CGFloat
  @State var kb1: Keyboard = Keyboard(title: "", geoWidth: 351, initialKey: .C, octaves: 1)
  @State var kb2: Keyboard = Keyboard(title: "", geoWidth: 351, initialKey: .C, octaves: 1)
  @State var kb3: Keyboard = Keyboard(title: "", geoWidth: 351, initialKey: .C, octaves: 3)
  
  var body: some View {
    VStack(alignment: .center) {
      Spacer()
      Spacer()
      HStack(spacing: 30) {
        VStack {
          Text("Base Chord")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(.white)
          kb1.resize(geoWidth: geoWidth * 0.85 * 0.5)
        }
        VStack {
          Text("UST")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(.white)
          kb2.resize(geoWidth: geoWidth * 0.85 * 0.5)
        }
      }
      Spacer()
      HStack {
        VStack {
          Text("Combined Chord")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(.white)
          kb3.resize(geoWidth: geoWidth * 0.9)
        }
      }
      Spacer()
      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
  }
}

#Preview {
  PortraitView(geoWidth: 351 * 2, kb1: Keyboard(title: "", geoWidth: 351 * 2), kb2: Keyboard(title: "", geoWidth: 351), kb3: Keyboard(title: "", geoWidth: 187, octaves: 3))
}
