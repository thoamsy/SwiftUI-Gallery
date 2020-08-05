//
//  ProgressViewDemo.swift
//  SwiftUI-Gallery (iOS)
//
//  Created by yk on 2020/8/5.
//

import SwiftUI


struct ProgressSection<P: View>: View {
  let text: String
  @Binding var progress: Double
  let progressView: P

  init(text: String, progress: Binding<Double>, progressView: () -> P) {
    self.text = text
    self._progress = progress
    self.progressView = progressView()
  }

  init(text: String, progressView: () -> P) {
    self.text = text
    self._progress = .constant(Double.nan)
    self.progressView = progressView()
  }


  var body: some View {
    Section(
      header: Text(text).font(.headline).foregroundColor(.secondary)
    ) {
      VStack {
        progressView
        if !progress.isNaN {
          Button("More", action: { progress += 0.05 })
        }
      }
    }
  }
}

struct ProgressViewDemo: View {

  @State private var linearProgress = 0.5
  @State private var stepProgress = 0.5

  var body: some View {
    VStack(alignment: .leading) {
      ProgressSection(text: "Linear", progress: $linearProgress) {
        ProgressView(value: linearProgress)
      }
      ProgressSection(text: "Circular") {
        ProgressView(label: { Label("Downloading", image: "plus.circle.fill") })
          .progressViewStyle(CircularProgressViewStyle(tint: .red))
          .frame(height: 100)
      }

      ProgressSection(text: "Step", progress: $stepProgress) {
        ProgressView("FOO", value: stepProgress)
//        ProgressView(value: stepProgress) {
//          Label("AMD YES!", image: "plus.circle.fill").labelStyle(IconOnlyLabelStyle())
//        }
      }

    }.padding()
  }
}

struct ProgressViewDemo_Previews: PreviewProvider {
  static var previews: some View {
    NavigationWrapper(title: "AMD YES!") {
      ProgressViewDemo()
    }
  }
}
