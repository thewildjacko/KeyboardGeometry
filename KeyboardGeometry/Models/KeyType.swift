//
//  KeyType.swift
//  KeyboardGeometry
//
//  Created by Jake Smolowe on 7/5/24.
//

import Foundation

enum KeyType: String {
  case C, D, E, F, G, A, B, endingC, endingE
  case Db, Eb, Gb, Ab, Bb
  
  var initialKeyPosition: CGFloat {
    switch self {
    case .C, .E, .G, .A, .endingC, .endingE:
      return 11.5
    case .D, .F, .B:
      return 12
    case .Db, .Eb, .Gb, .Ab, .Bb:
      return 7
    }
  }
  
  var nextKeyPosition: CGFloat {
    switch self {
    case .C:
      return 9.5
    case .Db:
      return 13.5
    case .D:
      return 14.5
    case .Eb:
      return 9.5
    case .E:
      return 23
    case .F:
      return 9.5
    case .Gb:
      return 14.5
    case .G:
      return 11.5
    case .Ab:
      return 11.5
    case .A:
      return 15.5
    case .Bb:
      return 7.5
    case .B:
      return 24
    case .endingC, .endingE:
      return 9.5
    }
  }
  
  var nextKey: KeyType {
    switch self {
    case .C, .endingC:
      return .Db
    case .Db:
      return .D
    case .D:
      return .Eb
    case .Eb:
      return .E
    case .E, .endingE:
      return .F
    case .F:
      return .Gb
    case .Gb:
      return .G
    case .G:
      return .Ab
    case .Ab:
      return .A
    case .A:
      return .Bb
    case .Bb:
      return .B
    case .B:
      return .C
    }
    
  }
}
