//
//  HTNavigationBar.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/3.
//

import SwiftUI

struct HTNavigationBar_Previews: PreviewProvider {
  static var previews: some View {
    HTNavigationBar{
      Text("test")
    }
  }
}

struct HTNavigationBar<Content>: View where Content: View {

  private var var_titleView: AnyView?
  private var var_leadingView: AnyView?
  private var var_trailingView: AnyView?
  private var var_foreground: Color = .black
  private var var_background: AnyView? = AnyView(Color.white)
  private var var_hiddenLine: Bool = true
  private var var_hasBackButton: Bool = true
  private var var_backButtonImageName: String?
  private var var_backButtonTapAction: HTBlock? = nil
  private var var_isBackButtonBlack: Bool = true
  private var var_leadingMaxWidth: CGFloat = 60
  private var var_trailingMaxWidth: CGFloat = 60
  private var var_ignoringTopArea: Bool = false

  private let var_content: Content

  var body: some View {
    ZStack(alignment: .top) {
      ZStack {
        Color.clear
        var_content
      }
      .padding(.top, var_ignoringTopArea ? 0 : HTHelper.NavigationBar.height + HTHelper.UnsafeArea.top)
      .frame(maxHeight: HTHelper.STATIC_HEIGHT)

      ZStack(alignment: .bottom) {
        HStack(alignment: .center, spacing: 0) {
          // leading
          HStack(spacing: 0) {
            if var_hasBackButton {
              HTDefaultBackButton(named: var_backButtonImageName, tapAction: var_backButtonTapAction, isBlack: var_isBackButtonBlack, foreground: var_foreground)
            }
            if (var_leadingView != nil) {
              var_leadingView
            } else {
              Color.clear
            }
            Spacer()
          }
          .padding(.leading, 15)
          .frame(maxWidth: var_leadingMaxWidth)
          .background(Color.clear)

          // title
          if (var_titleView != nil) {
            var_titleView
              .frame(maxWidth: .infinity)
              .background(Color.clear)
          } else {
            Spacer()
          }

          // trailing
          HStack(spacing: 0) {
            Spacer()
            if (var_trailingView != nil) {
              var_trailingView
            } else {
              Color.clear
            }
          }
          .padding(.trailing, 15)
          .frame(maxWidth: var_trailingMaxWidth)
          .background(Color.clear)
        }
        .frame(height: HTHelper.NavigationBar.height)
        .padding(.top, HTHelper.UnsafeArea.top)
        .foregroundColor(var_foreground)
        .background(var_background)
        .clipped()

        // line
        if !var_hiddenLine {
          Divider()
            .frame(maxWidth: .infinity)
        }
      }
    }
    .navigationBarHidden(true)
    .edgesIgnoringSafeArea(.all)
  }
}

extension HTNavigationBar {
  public init(@ViewBuilder content: () -> Content) {
    self.var_content = content()
  }

  public func ht_title(title: String) -> HTNavigationBar {
    var var_bar = self
    var_bar.var_titleView = AnyView(
      Text(title)
        .lineLimit(1)
        .foregroundColor(var_foreground)
        .font(.system(size: 17))
    )
    return var_bar
  }

  public func ht_foreground(foreground: Color) -> HTNavigationBar {
    var var_bar = self
    var_bar.var_foreground = foreground
    return var_bar
  }

  public func ht_background<Background>(_ background: Background)
  -> HTNavigationBar where Background: View {
    var var_bar = self
    var_bar.var_background = AnyView(background)
    return var_bar
  }

  public func ht_backButtonHidden(_ hidden: Bool)
  -> HTNavigationBar {
    var var_bar = self
    var_bar.var_hasBackButton = !hidden
    return var_bar
  }

  public func ht_isBackButtonBlack(isBlack: Bool) -> HTNavigationBar {
    var var_bar = self
    var_bar.var_isBackButtonBlack = isBlack
    return var_bar
  }

  public func ht_ignoringTopArea(ignore: Bool) -> HTNavigationBar {
    var var_bar = self
    var_bar.var_ignoringTopArea = ignore
    return var_bar
  }

  public func ht_maxWidth(leading: CGFloat = 80, trailing: CGFloat = 80) -> HTNavigationBar {
    var var_bar = self
    var_bar.var_leadingMaxWidth = leading
    var_bar.var_trailingMaxWidth = trailing
    return var_bar
  }

  public func ht_navigationBarTitleView<Content: View>(@ViewBuilder titleView: () -> Content) -> HTNavigationBar {
    let titleV = titleView()
    var var_bar = self
    var_bar.var_titleView = AnyView(titleV)
    return var_bar
  }

  public func ht_navigationBarItems<Leading: View, Trailing: View>(
    @ViewBuilder leading: () -> Leading,
    @ViewBuilder trailing: () -> Trailing)
  -> some View {
    let var_l = leading()
    let var_t = trailing()
    var var_bar = self
    var_bar.var_leadingView = AnyView(var_l)
    var_bar.var_trailingView = AnyView(var_t)
    return var_bar
  }

  public func ht_navigationBarItems<Content: View>(@ViewBuilder leading: () -> Content) -> some View {
    let var_v = leading()
    var var_bar = self
    var_bar.var_leadingView = AnyView(var_v)
    return var_bar
  }

  public func ht_navigationBarItems<Content: View>(@ViewBuilder trailing: () -> Content) -> some View {
    let var_v = trailing()
    var var_bar = self
    var_bar.var_trailingView = AnyView(var_v)
    return var_bar
  }
}
