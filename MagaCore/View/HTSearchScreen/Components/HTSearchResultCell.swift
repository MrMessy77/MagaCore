//
//  HTSearchResultCell.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/7.
//

import SwiftUI

struct HTSearchResultCell: View {
  var columns: [GridItem] = [GridItem(.adaptive(minimum: 48, maximum: 80))]

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      HStack(spacing: 10){
        HTCoverView(var_width: 76, var_height: 112)
        VStack(alignment: .leading, spacing: 4){
          Text("Mother of the goddess’ dormitory (uncensored)uncensoreduncensoreduncensored")
            .font(.system(size: 14))
            .fontWeight(.bold)
            .lineLimit(1)
            .padding(.trailing, 50)
            .frame(width: .infinity, alignment: .topLeading)
          Text("season 1")
            .font(.system(size: 10))
            .lineLimit(1)
            .foregroundColor(Color(hex: "#999999"))
          Text("apr 2, 2007 to oct 1, 2007")
            .font(.system(size: 10))
            .lineLimit(1)
            .foregroundColor(Color(hex: "#999999"))
          Spacer().frame(height: 18)
          Text("series · dub · sub")
            .font(.system(size: 10))
            .foregroundColor(Color(hex: "#FF6C3C"))
            .padding(.top, 10)
        }
      }
      .padding(.trailing, 15)
      .padding(.vertical, 15)

      LazyVGrid(columns: columns, spacing: 5) {
        ForEach((0...5), id: \.self) {index in
          Text("\(index)")
            .font(.system(size: 14))
            .frame( minWidth: 50, maxWidth: .infinity, minHeight: 32)
            .background(Color.black.opacity(0.04))
            .cornerRadius(4)
        }
      }
      .padding(.trailing, 15)
      .padding(.bottom, 15)
    }
    .padding(.leading, 15)
    .background(Color.white)
  }
}

struct HTSearchResultCell_Previews: PreviewProvider {
  static var previews: some View {
    HTSearchResultCell()
  }
}
