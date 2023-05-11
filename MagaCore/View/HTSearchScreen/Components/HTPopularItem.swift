//
//  HTPopularItem.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/6.
//

import SwiftUI

struct HTPopularItem: View {

  var var_numTitle: String = "01"
  var var_numTitleColor: Color = Color(hex: "#999999")

  var var_name: String = "demon slayer"

  var body: some View {
    HStack(spacing: 0){
      Text(var_numTitle)
        .font(.system(size: 20))
        .foregroundColor(var_numTitleColor)
      Text(var_name)
        .font(.system(size: 12))
        .padding(.leading, 10)
    }
  }
}

struct HTPopularItem_Previews: PreviewProvider {
  static var previews: some View {
    HTPopularItem()
  }
}
