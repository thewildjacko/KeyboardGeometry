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
  
  var nextKeyOffset: CGFloat {
    switch self {
    case .C:
      return 14
    case .Db:
      return 9
    case .D:
      return 19
    case .Eb:
      return 5
    case .E:
      return 23
    case .F:
      return 13
    case .Gb:
      return 11
    case .G:
      return 16
    case .Ab:
      return 7
    case .A:
      return 20
    case .Bb:
      return 3
    case .B:
      return 24
    case .endingC, .endingE:
      return 23
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
