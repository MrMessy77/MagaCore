//
//  HTSearchScreen.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/1.
//

import SwiftUI

struct HTSearchScreen: View {

  @State var var_searchText: String = ""

  var body: some View {
    HTNavigationBar{
//      HTSearchHistoryView()
//      HTSearchListView()
      HTSearchResultView()
    }
    .ht_navigationBarTitleView(titleView: {
      HTSearchBar(var_placeholder: "one piece: clockwork island |", var_text: $var_searchText)
    })
    .ht_maxWidth(leading: 40, trailing: 15)
  }
}

struct HTSearchScreen_Previews: PreviewProvider {
  static var previews: some View {
    HTSearchScreen()
  }
}
