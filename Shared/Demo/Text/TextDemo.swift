//
//  TextDemo.swift
//  SwiftUI-Gallery (iOS)
//
//  Created by yk on 2020/8/2.
//

import SwiftUI



extension Font.TextStyle: Identifiable, CustomStringConvertible {
  public var id: String {
    self.description
  }

  public var description: String {
    let result: String
    switch self {
      case .body:
        result = "body"
      case .callout:
        result = "callout"
      case .caption:
        result = "caption"
      case .caption2:
        result = "caption2"
      case .footnote:
        result = "footnote"
      case .headline:
        result = "headline"
      case .largeTitle:
        result = "largeTitle"
      case .subheadline:
        result = "subheadline"
      case .title:
        result = "title"
      case .title2:
        result = "title2"
      case .title3:
        result = "title3"

      @unknown default:
        result = "error"
    }
    return result.capitalized
  }
}

extension Font.Weight: Identifiable, CustomStringConvertible {
  public var id: String {
    self.description
  }
  public var description: String {
    switch self {
      case .black:
        return "black"
      case .bold:
        return "bold"
      case .heavy:
        return "heavy"
      case .light:
        return "light"
      case .medium:
        return "medium"
      case .regular:
        return "regular"
      case .semibold:
        return "semibold"
      case .thin:
        return "thin"
      case .ultraLight:
        return "ultraLight"
      case .regular:
      fallthrough
      default:
        return "regular"
    }
  }
}

extension Font.Design: Identifiable, CustomStringConvertible, CaseIterable {

  // public typealias AllCases = [String]

  public static var allCases: [Font.Design] {
    return [.default, .monospaced, .rounded, .serif]
  }

  public var id: String {
    self.description
  }
  public var description: String {
    switch self {
      case .default:
        return "default"
      case .rounded:
        return "rounded"
      case .monospaced:
        return "monospaced"
      case .serif:
        return "serif"
      @unknown default:
        return "serif"
    }
  }
}



struct TextDemo: View {
  @State private var content = "Yes"
  @State private var color = Color(UIColor.label)
  @State private var fontStyle: Font.TextStyle = .body
//  @State private var fontWeight: Font.Weight = .regular
  @State private var fontDesign: Font.Design = .default



  var body: some View {
    VStack(alignment: .leading) {
      Text(content)
        .foregroundColor(color)
        .font(.system(fontStyle, design: fontDesign))

//      TextField("Write the content", text: $content)
// .textFieldStyle(PlainTextFieldStyle())
      ColorPicker("Change the Color", selection: $color)
      HStack {
        Picker("Font Style", selection: $fontStyle) {
          ForEach(Font.TextStyle.allCases) { style in
            Text(style.description).tag(style)
          }
        }.frame(minWidth: 0, maxWidth: .infinity)
        Spacer()
        Picker("Font Weight", selection: $fontDesign) {
          ForEach(Font.Design.allCases) { design in
            Text(design.description).tag(design)
          }
        }.frame(minWidth: 0, maxWidth: .infinity)

      }
    }.padding()
  }
}

struct TextDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextDemo()
    }
}
