//
//  Views.swift
//  SwiftUI-Gallery (iOS)
//
//  Created by yk on 2020/8/2.
//

import SwiftUI


struct ViewCell: Identifiable {
  let title: String
  let builder: () -> AnyView.Type

  var id: String {
    title
  }
}

