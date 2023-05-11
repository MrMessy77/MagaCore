//
//  HTTagView.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/4.
//

import SwiftUI

struct HTTagView: View {

  var var_name: String = ""
  var var_cornerRadius: CGFloat = 2
  var var_nameSize: CGFloat = 10
  var var_nameColor: Color = Color(hex: "#999999")
  var var_tagColor: Color = Color(red: 0, green: 0, blue: 0, opacity: 0.04)
  var var_padding: EdgeInsets = EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8)

  var body: some View {
    VStack{
      Text(var_name)
        .font(.system(size: var_nameSize))
        .foregroundColor(var_nameColor)
    }
    .padding(var_padding)
    .background(var_tagColor)
    .cornerRadius(var_cornerRadius)
  }
}

struct HTTagView_Previews: PreviewProvider {
  static var previews: some View {
    HTTagView(var_name: "DUB")
  }
}
