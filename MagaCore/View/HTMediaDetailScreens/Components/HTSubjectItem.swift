//
//  HTSubjectItem.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/4.
//

import SwiftUI

struct HTSubjectItem: View {
  var body: some View {
    VStack(spacing: 0){
      HTCoverView(var_cornerRadius: 0)
      VStack(alignment: .leading, spacing: 3){
        HStack(alignment: .top) {
          Text("one piece: clockwork island adventure")
            .font(.system(size: 12))
            .fontWeight(.bold)
            .lineLimit(2)
            .lineSpacing(4)
        }
        .frame(width: .infinity, height: 36, alignment: .topLeading)

        Text("dub · airing")
          .font(.system(size: 10))
          .fontWeight(.bold)
          .lineLimit(1)
          .frame(height: 14)
          .foregroundColor(Color(hex: "#FF6C3C"))
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .frame(maxWidth: .infinity)
      .padding(4)
    }
    .frame(width: 106)
    .background(Color.white)
    .cornerRadius(6)
  }
}

struct HTSubjectItem_Previews: PreviewProvider {
  static var previews: some View {
    HTSubjectItem()
  }
}
