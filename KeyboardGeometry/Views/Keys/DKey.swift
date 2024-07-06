////
////  DKey.swift
////  KeyboardGeometry
////
////  Created by Jake Smolowe on 7/5/24.
////
//
//import SwiftUI
//
//struct DKey: View, KeyboardKeys {
//  var id: UUID = UUID()
//  
//  var type: KeyType { .D }
//  var octave: CGFloat = 0
//  var geometry: GeometryProxy
//  var size: CGFloat
//  var widthMod: CGFloat
//  var initialKey: Bool = false
//  var keyOffset: CGFloat = 0
//  
//  var body: some View {
//    ZStack {
//      DShape().path(
//        in: CGRect(
//          x: 0, y: 0,
//          width: width, height: height
//        ))
//      .fill(.clear)
//      
//      DShape().path(
//        in: CGRect(
//          x: 0, y: 0,
//          width: width, height: height
//        ))
//      .stroke(lineWidth: 1)
//    }
//    .frame(width: width, height: height)
//  }
//}
//
//extension DKey {
//  init(geometry: GeometryProxy, size: CGFloat, widthMod: CGFloat) {
//    self.geometry = geometry
//    self.size = size
//    self.widthMod = widthMod
//  }
//}
//
//#Preview {
//  GeometryReader { geometry in
//    DKey(geometry: geometry, size: 2, widthMod: 23)
//  }
//  .frame(width: Width.octave.rawValue * 2)
//}
