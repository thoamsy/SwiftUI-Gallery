//
//  ContentView.swift
//  Shared
//
//  Created by yk on 2020/8/2.
//

import SwiftUI

enum TextCase: String, CaseIterable, Identifiable {
  var id: String {
    return self.rawValue
  }

  case text
  case textField
  case secureField
  case textEditer

  var builder: some View {
    switch self {
      case .text:
        return Text(self.rawValue)
      default:
        return Text(self.rawValue)
    }
  }
}

struct ContentView: View {

    var body: some View {
      NavigationView {
        Section {
          List(TextCase.allCases) {
            Text($0.rawValue)
          }
        }.navigationTitle("SwiftUI Gallery")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        ContentView()
      }
    }
}
