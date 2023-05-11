//
//  HTHomeScreen.swift
//  MagaCore
//
//  Created by MrMessy on 2023/4/29.
//

import SwiftUI

struct HTHomeScreen: View {

  @EnvironmentObject private var store: AppStore
  @State var var_searchText: String = ""

  //  @Environment(\.topSafeAreaSize) var topSafeAreaSize

  var body: some View {
    ZStack{
      VStack {
        Image("home_mask1")
          .resizable()
          .frame(width: UIScreen.main.bounds.width, height: 116)
        Image("home_mask2")
          .resizable()
          .frame(width: UIScreen.main.bounds.width, height: 154)
          .offset(y: -10)
      }
      .frame(maxHeight: .infinity, alignment: .top)

      VStack{
        HTNavigationBar{
          ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
              HTSubjectScrollView(var_title: store.state.animeState.var_title ?? "")
              HTSubjectScrollView(var_title: "Trending", var_showSeeAll: true)
              HTSubjectScrollView(var_title: "Trending", var_showSeeAll: true)
              HTSubjectScrollView(var_title: "Trending", var_showSeeAll: true)
            }
            .padding(.vertical, 30)
          }
          .frame(minWidth: HTHelper.STATIC_WIDTH)
        }
        .ht_backButtonHidden(true)
        .ht_background(Color.clear)
        .ht_navigationBarTitleView(titleView: {
          TextField("one piece: clockwork island adventure", text: $var_searchText)
            .font(.system(size: 12))
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity)
            .frame(height: 36)
            .foregroundColor(Color.white)
            .background(Color.white.opacity(0.5))
            .clipShape(Capsule())
            .overlay(
              Image("search")
                .resizeToFit()
                .padding(.vertical, 12)
                .padding(.leading, 10)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            )
        })
        .ht_navigationBarItems(leading: {
          Image("share")
            .resizable()
            .frame(width: 22, height: 22)
        }, trailing: {
          Image("record")
            .resizable()
            .frame(width: 24, height: 24)
        })
      }
    }
    .frame(maxHeight: .infinity, alignment: .top)
    .background(Color(hex: "#f5f5f5"))
    .ignoresSafeArea()
    .onAppear{
      store.dispatch(AnimeAction.ht_changeTitle())
      store.dispatch(AnimeAction.ht_homeData())
    }
  }
}

struct HTHomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HTHomeScreen()
  }
}
