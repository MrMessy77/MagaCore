//
//  TopSafeAreaSize.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/2.
//

import SwiftUI

private struct TopSafeAreaSize: EnvironmentKey {
  static let defaultValue = 0
}

extension EnvironmentValues {
  var topSafeAreaSize: CGFloat {

    get {
      let window = UIApplication.shared.windows[0]
      let safeFrame = window.safeAreaLayoutGuide.layoutFrame
      return safeFrame.minY
    }

  }
}
