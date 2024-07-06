//
//  TheKey.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import SwiftUI

struct TheKey: View, KeyboardKeys, Identifiable {
  var id: UUID = UUID()
  
  var type: KeyType
  var octave: CGFloat = 0
  var geometry: GeometryProxy
  var size: CGFloat
  var widthMod: CGFloat
  var initialKey: Bool = false
  var keyOffset: CGFloat = 0
  
  var body: some View {
    ZStack {
      switch type {
      case .C:
        CandEShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .fill(fill)
        
        CandEShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .stroke(.black, lineWidth: 1)
      case .D:
        DShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .fill(fill)
        
        DShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .stroke(.black, lineWidth: 1)
      case .E:
        CandEShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .fill(fill)
        .rotation3DEffect(
          .degrees(180),
          axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        CandEShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .stroke(.black, lineWidth: 1)
        .rotation3DEffect(
          .degrees(180),
          axis: (x: 0.0, y: 1.0, z: 0.0)
        )

      case .F:
        FandBShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .fill(fill)
        
        FandBShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .stroke(.black, lineWidth: 1)
      case .G:
        GandAShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .fill(fill)
        
        GandAShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .stroke(.black, lineWidth: 1)
      case .A:
        GandAShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .fill(fill)
        .rotation3DEffect(
          .degrees(180),
          axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        
        GandAShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .stroke(.black, lineWidth: 1)
        .rotation3DEffect(
          .degrees(180),
          axis: (x: 0.0, y: 1.0, z: 0.0)
        )
      case .B:
        FandBShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .fill(fill)
        .rotation3DEffect(
          .degrees(180),
          axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        
        FandBShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .stroke(.black, lineWidth: 1)
        .rotation3DEffect(
          .degrees(180),
          axis: (x: 0.0, y: 1.0, z: 0.0)
        )
      case .Db, .Eb, .Gb, .Ab, .Bb:
        BlackKeyShape(width: width, height: height, radius: radius).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .fill(fill)
        
        BlackKeyShape(width: width, height: height, radius: radius).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .stroke(.black, lineWidth: 1)
      case .endingC, .endingE:
        EndingCandEShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .fill(fill)
        
        EndingCandEShape(width: width, height: height, radius: radius, widthMultiplier: widthMultiplier).path(
          in: CGRect(
            x: 0, y: 0,
            width: width, height: height
          ))
        .stroke(.black, lineWidth: 1)
      }
    }
    .frame(width: width, height: height)
    .zIndex(z_Index)
    .offset(x: offset)
  }
}

extension TheKey {
  init(type: KeyType = .C, geometry: GeometryProxy, size: CGFloat, widthMod: CGFloat) {
    self.type = type
    self.geometry = geometry
    self.size = size
    self.widthMod = widthMod
  }
}

#Preview {
  GeometryReader { geometry in
    //    HStack(spacing: 0) {
    TheKey(type: .C, geometry: geometry, size: 1, widthMod: 23)
//    TheKey(type: .D, geometry: geometry, size: 2, widthMod: 23)
//    TheKey(type: .E, geometry: geometry, size: 2, widthMod: 23)
//    TheKey(type: .F, geometry: geometry, size: 2, widthMod: 23)
//    TheKey(type: .G, geometry: geometry, size: 2, widthMod: 23)
//    TheKey(type: .A, geometry: geometry, size: 2, widthMod: 23)
//    TheKey(type: .B, geometry: geometry, size: 2, widthMod: 23)
//    TheKey(type: .C, geometry: geometry, size: 2, widthMod: 23)
    //    }
  }
  .frame(width: 23 * 4, height: 96 * 4)
  .border(.black)
}
