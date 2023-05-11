//
//  HTPackageItem.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/8.
//

import SwiftUI

struct HTPackageItem: View {

  var var_isSel: Bool = true

  var body: some View {
    VStack(alignment: .leading, spacing: 0){
      HStack{
        Text("Trial")
          .font(.system(size: 14))
      }
      .frame(width: 70, height: 24)
      .background(LinearGradient(colors: [Color(hex: "#EDC391"), Color(hex: "#FDDDB7")], startPoint: .leading, endPoint: .trailing))
      .clipShape(HTRroundedCorners(var_br: 6))
      Text("Yearly")
        .font(.system(size: 12))
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity)
        .padding(.top, 6)
      Text("$29.99")
        .font(.system(size: 24))
        .fontWeight(.medium)
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
      Text("$102")
        .strikethrough()
        .font(.system(size: 12))
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity)
        .padding(.top, 15)
    }
    .frame(width: 100, height: 122, alignment: .topLeading)
    .background(LinearGradient(colors: [Color(hex: "#FF6D1C"), Color(hex: "#FF1C1C")], startPoint: .trailing, endPoint: .leading))
    .cornerRadius(6)
  }
}

struct HTPackageItem_Previews: PreviewProvider {
  static var previews: some View {
    HTPackageItem()
  }
}
