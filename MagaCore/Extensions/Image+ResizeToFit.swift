//
//  HTImage+ResizeToFit.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/4.
//

import SwiftUI

extension Image {

  @ViewBuilder func resizeToFit() -> some View {
    self
      .resizable()
      .scaledToFit()
  }
}
