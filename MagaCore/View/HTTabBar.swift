//
//  HTTabBar.swift
//  MagaCore
//
//  Created by MrMessy on 2023/4/29.
//

import SwiftUI

struct HTTabBar: View {

  @EnvironmentObject var var_tabbarVM:HTTabBarViewModel
  @StateObject var var_tabbarState: HTTabBarViewModel

  var body: some View {
    ZStack {
      VStack(spacing: 0) {
        HStack {
          HTTabBarItem(var_tabbarVM: _var_tabbarVM,
                       var_tabbarState: var_tabbarState,
                       var_selectIndex: 0,
                       itemName: "Home")
        }
        .frame(height: 60)
//        .background(Color.spotifyLightGray)

        // To fill the bottom safe area
        Rectangle()
//          .fill(Color.spotifyLightGray)
          .ignoresSafeArea()
          .frame(height: 0)
      }
    }
  }

  private struct HTTabBarItem: View {
    @EnvironmentObject var var_tabbarVM:HTTabBarViewModel
    @StateObject var var_tabbarState: HTTabBarViewModel

    var var_selectIndex: Int
    var itemName: String
//    var iconWhenUnselected: Image
//    var iconWhenSelected: Image

    var thisPageIsTheCurrentPage: Bool {
      var_tabbarState.var_tabbarIndex == var_selectIndex
    }

    var body: some View {
      VStack(alignment: .center, spacing: 5) {
        Spacer()
        //        buildIcon()
        Text(itemName)
      }.frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .onTapGesture {
          var_tabbarVM.var_tabbarIndex = var_selectIndex
        }
        .foregroundColor(thisPageIsTheCurrentPage ? .white : .white.opacity(0.5))
    }

    //    func buildIcon() -> some View {
    //      var icon: Image
    //
    //      if thisPageIsTheCurrentPage {
    //        icon = iconWhenSelected
    //      } else {
    //        icon = iconWhenUnselected
    //      }
    //
    //      return icon.resizeToFit()
    //        .colorMultiply(thisPageIsTheCurrentPage ? .white : .white.opacity(Constants.opacityHigh))
    //        .frame(width: 25)
    //    }
  }
}

struct HTTabBar_Previews: PreviewProvider {
  static var previews: some View {
    HTTabBar(
      var_tabbarState: HTTabBarViewModel()
    )
  }
}
