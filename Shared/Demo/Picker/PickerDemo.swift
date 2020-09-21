//
//  PickerDemo.swift
//  SwiftUI-Gallery (iOS)
//
//  Created by yk on 2020/8/5.
//

import SwiftUI

enum PickerStyle: String, CaseIterable, Identifiable {
  var id: String {
    self.rawValue
  }

  case `default`
  case wheel
  case segmented
  case form
}

extension View {
  @ViewBuilder func pickerStyle(_ style: PickerStyle) -> some View {
    switch style {
      case .default, .form:
        self.pickerStyle(DefaultPickerStyle())
      case .wheel:
        self.pickerStyle(WheelPickerStyle())
      case .segmented:
        self.pickerStyle(SegmentedPickerStyle())
    }
  }
}

enum Flavor: String, CaseIterable, Identifiable {
  case chocolate
  case vanilla
  case strawberry


  var id: String { self.rawValue }
}

struct PickerDemo: View {
  @State private var currentStyle = PickerStyle.default
  @State private var selectedFlavor = Flavor.chocolate

  var picker: some View {
    Picker("Flavor", selection: $selectedFlavor) {
      Text("Chocolate").tag(Flavor.chocolate)
      Text("Vanilla").tag(Flavor.vanilla)
      Text("Strawberry").tag(Flavor.strawberry)
    }.pickerStyle(currentStyle)
  }

  var body: some View {
    NavigationWrapper(title: "Yes") {
      VStack {
        Picker("", selection: $currentStyle) {
          ForEach(PickerStyle.allCases) {
            Text($0.rawValue.capitalized).tag($0)
          }
        }.pickerStyle(SegmentedPickerStyle())

        if currentStyle == .form {
          Form {
            picker
          }
        } else {
          picker
        }
        Text("Selected flavor: \(selectedFlavor.rawValue)")
      }
    }
  }
}

struct PickerDemo_Previews: PreviewProvider {
  static var previews: some View {
    PickerDemo()
  }
}
