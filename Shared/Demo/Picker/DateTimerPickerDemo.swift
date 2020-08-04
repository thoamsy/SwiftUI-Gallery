//
//  DateTimerPickerDemo.swift
//  SwiftUI-Gallery (iOS)
//
//  Created by yk on 2020/8/3.
//

import SwiftUI
import Combine


struct AnyDatePickerStyle<PickerStyle: DatePickerStyle> {
  let style: PickerStyle
  init(_ style: PickerStyle) {
    self.style = style
  }
}

extension View {
  @ViewBuilder func dateStyle(_ dateStyle: DateStyle) -> some View {
    switch dateStyle {
      case .default:
        self.datePickerStyle(DefaultDatePickerStyle())
      case .graphical:
        self.datePickerStyle(GraphicalDatePickerStyle())
      case .wheel:
        self.datePickerStyle(WheelDatePickerStyle())
    }
  }
}


enum DateStyle: String, CaseIterable, Identifiable {
  case `default`
  case graphical
  case wheel

  var id: String {
    self.rawValue
  }
}

struct DateTimerPickerDemo: View {
  @State private var date = Date()
  @State private var dateStyleSelection = DateStyle.default
    var body: some View {
      VStack {
        Picker("FOO", selection: $dateStyleSelection) {
          ForEach(DateStyle.allCases) {
            Text($0.rawValue.capitalized).tag($0)
          }
        }.pickerStyle(SegmentedPickerStyle())
        DatePicker("", selection: $date, displayedComponents: [.date])
          .padding()
          .frame(height: 500)
          .dateStyle(dateStyleSelection)
      }
    }
}

struct DateTimerPickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        DateTimerPickerDemo()
    }
}
