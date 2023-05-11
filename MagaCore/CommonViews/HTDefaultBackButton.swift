//
//  HTDefaultBackButton.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/4.
//

import SwiftUI

struct HTDefaultBackButton: View {

  @Environment(\.presentationMode) var var_presentationMode: Binding<PresentationMode>
  var var_named: String?
  var var_isBlack: Bool = true
  var var_foreground: Color = .black
  var var_action: HTBlock?

  init(named: String? = nil, tapAction: HTBlock? = nil, isBlack: Bool = true, foreground: Color = .black) {
    self.var_named = named
    self.var_action = tapAction
    self.var_isBlack = isBlack
    self.var_foreground = foreground
  }

  var body: some View {
    Button(action: {
      if let action = var_action {
        action()
      } else {
        self.var_presentationMode.wrappedValue.dismiss()
      }
    }) {
      ht_backImage()
        .resizable()
        .frame(width: 7, height: 15)
        .aspectRatio(contentMode: .fit)
        .foregroundColor(var_foreground)
    }
  }

  private func ht_backImage() -> Image {
    if var_named != nil {
      return Image(var_named!)
    } else {
      return Image(var_isBlack ? "back_black" : "back_white")
    }
  }
}

struct HTDefaultBackButton_Previews: PreviewProvider {
  static var previews: some View {
    HTDefaultBackButton()
  }
}
