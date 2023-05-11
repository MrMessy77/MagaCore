//
//  HTSubjectCell.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/4.
//

import SwiftUI

struct HTSubjectCell: View {
    var body: some View {
      VStack(alignment: .leading) {
        HStack(spacing: 10){
          HTCoverView(var_width: 76, var_height: 112)
          VStack(alignment: .leading, spacing: 4){
            Text("Mother of the goddess’ dormitory (uncensored)uncensoreduncensoreduncensored")
              .font(.system(size: 14))
              .fontWeight(.bold)
              .lineLimit(2)
              .lineSpacing(5)
              .frame(width: .infinity, height: 42, alignment: .topLeading)
            Text("season 1")
              .font(.system(size: 10))
              .lineLimit(1)
              .foregroundColor(Color(hex: "#999999"))
            Text("apr 2, 2007 to oct 1, 2007")
              .font(.system(size: 10))
              .lineLimit(1)
              .foregroundColor(Color(hex: "#999999"))
            HStack(spacing: 4) {
              HTTagView(var_name: "Ep10", var_nameColor: Color(hex: "#FF6C3C"), var_tagColor: Color(hex: "#FF6C3C").opacity(0.1))
              HTTagView(var_name: "DUB")
              HTTagView(var_name: "SUB")
            }
            .padding(.top, 10)
          }
        }
        .padding(.trailing, 15)
        .padding(.top, 15)
        Divider()
      }
      .padding(.leading, 15)
    }
}

struct HTSubjectCell_Previews: PreviewProvider {
    static var previews: some View {
        HTSubjectCell()
    }
}
