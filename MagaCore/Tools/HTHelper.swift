//
//  HTHelper.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/3.
//

import UIKit

public typealias HTBlock = () -> Void

enum HTHelper {
  static let STATIC_HEIGHT: CGFloat = UIScreen.main.bounds.size.height
  static let STATIC_WIDTH: CGFloat = UIScreen.main.bounds.size.width

  /// Portrait
  enum UnsafeArea {
    static var top: CGFloat {
      UIWindow.keyWindow?.safeAreaInsets.top ?? 0
    }
  }

  enum StatusBar {
    //    static var frame: CGRect {
    //      UIWindow.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
    //    }
    static var height: CGFloat {
      return 54.0
      if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
      } else {
        return UIApplication.shared.statusBarFrame.height
      }
    }
  }

  enum NavigationBar {
    static let height: CGFloat = 44
    static let bottom: CGFloat = height + StatusBar.height
  }

  static var iphoneXSeries: Bool {
    if UIDevice.current.userInterfaceIdiom != UIUserInterfaceIdiom.phone {
      debugPrint("not iPhone - \(UIDevice.current.userInterfaceIdiom.rawValue)")
    }
    if #available(iOS 11.0, *) {
      if let bottom = UIWindow.keyWindow?.safeAreaInsets.bottom, bottom > 0 {
        return true
      }
    } else {
      debugPrint("iOS11 previews")
    }
    return false
  }
}

extension UIWindow {
  static var keyWindow: UIWindow? {
    if #available(iOS 13.0, *) {
      return UIApplication.shared.windows.filter({ $0.isKeyWindow }).first
    } else {
      return UIApplication.shared.keyWindow
    }
  }
}
