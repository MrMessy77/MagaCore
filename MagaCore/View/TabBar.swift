//
//  TabBar.swift
//  MagaCore
//
//  Created by MrMessy on 2023/4/29.
//

import SwiftUI

struct TabBar: View {

  @Environment(\.presentationMode) var var_presentationMode

  init() {
    UITabBar.appearance().backgroundColor = UIColor(.white)
    UITabBar.appearance().unselectedItemTintColor = UIColor(Color(hex: "#393939"))

    let navibarAppearance = UINavigationBarAppearance()
    navibarAppearance.configureWithOpaqueBackground()
    navibarAppearance.backgroundColor = .white
    UINavigationBar.appearance().standardAppearance = navibarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navibarAppearance
  }

  @State var selectIndex:Int = 0
  var body: some View {
    NavigationView {
      TabView(selection: $selectIndex) {
        HTHomeScreen().tabItem {
          Image(selectIndex == 0 ? "home_sel" : "home")
          Text("Home")
        }.tag(0)
        HTPremiumScreen().tabItem {
          Image(selectIndex == 1 ? "premium_sel" : "premium")
          Text("Premium")
        }.tag(1)
      }
      .accentColor(Color(hex: "#FF6C3C"))
    }
  }
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TabBar()
  }
}
