//
//  Util.swift
//  SwiftUI-Gallery (iOS)
//
//  Created by yk on 2020/8/5.
//

import SwiftUI

struct Util: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
struct NavigationWrapper<Content: View>: View {
  let title: String
  let content: Content

  init(title: String, content: () -> Content) {
    self.content = content()
    self.title = title
  }

  var body: some View {
    NavigationView {
      content.navigationTitle(title)
    }
  }
}

struct Util_Previews: PreviewProvider {
    static var previews: some View {
      NavigationWrapper(title: "FOO"){
        Text("!!!")
      }
    }
}
