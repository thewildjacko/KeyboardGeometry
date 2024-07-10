//
//  KBPreviewView.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/8/24.
//

import SwiftUI

struct KBPreviewView: View {
  @State var screenSize: CGSize = .zero
  @State var size1: CGFloat = .zero
  @State var kb1: Keyboard = Keyboard(geoWidth: 351, initialKey: .C, octaves: 1)
  @State var kb2: Keyboard = Keyboard(geoWidth: 351, initialKey: .C, octaves: 1)
  @State var kb3: Keyboard = Keyboard(geoWidth: 351, initialKey: .C, octaves: 3)

  var body: some View {
    GeometryReader { geo in
      VStack(alignment: .center) {
        Spacer()
        Spacer()
        HStack(spacing: 20) {
          kb1.resize(geoWidth: geo.size.width * 0.85 * 0.5)
          kb2.resize(geoWidth: geo.size.width * 0.85 * 0.5)
        }
        Spacer()
        Spacer()
        HStack {
          kb3.resize(geoWidth: geo.size.width * 0.9)
        }
        Spacer()
        Spacer()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    .background(
        Color.indigo
    )
    .ignoresSafeArea(.all)
  }
}

#Preview {
  KBPreviewView()
}
