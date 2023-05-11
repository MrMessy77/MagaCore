//
//  HTSearchResultView.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/7.
//

import SwiftUI

struct HTSearchResultView: View {
  var body: some View {
    VStack{
      List(0..<10) { item in
        VStack{
          HTSearchResultCell()
            .cornerRadius(8)
        }
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets())
      }
      .listStyle(.plain)
    }
    .background(Color(hex: "#f5f5f5"))
  }
}

struct HTSearchResultView_Previews: PreviewProvider {
  static var previews: some View {
    HTSearchResultView()
  }
}
