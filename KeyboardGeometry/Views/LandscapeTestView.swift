//
//  KBPreviewView.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/8/24.
//

import SwiftUI

struct LandscapeTestView: View {
  @State var screenSize: CGSize = .zero
  @State var size1: CGFloat = .zero
  @State var kb1: Keyboard = Keyboard(title: "", geoWidth: 351, initialKey: .C, octaves: 1)
  @State var kb2: Keyboard = Keyboard(title: "", geoWidth: 351, initialKey: .C, octaves: 1)
  @State var kb3: Keyboard = Keyboard(title: "", geoWidth: 351, initialKey: .C, octaves: 3)

  var body: some View {
    GeometryReader { geo in
      VStack(alignment: .center, spacing: 5) {
        HStack(spacing: 100) {
          VStack(spacing: 10) {
            Text("Base Chord")
              .font(.title)
              .fontWeight(.heavy)
              .foregroundStyle(.white)
            kb1
          }
          VStack(spacing: 10) {   
            Text("UST")
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
      .onAppear(perform: {
        kb1 = kb1.resize(geoWidth: geo.size.width * 0.5 * 0.5)
        kb2 = kb2.resize(geoWidth: geo.size.width * 0.5 * 0.5)
        kb3 = kb3.resize(geoWidth: geo.size.width * 0.9)
      })
    }
    .background(
        Color.indigo
    )
    .ignoresSafeArea(.all)
  }
}

#Preview {
  LandscapeTestView()
}
