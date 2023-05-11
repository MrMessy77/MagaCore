//
//  HTPremiumPackageSection.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/8.
//

import SwiftUI

struct HTPremiumPackageSection: View {

//  var var_packages = [];

  var body: some View {
    VStack(alignment: .leading){
      LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())], alignment: .leading, spacing: 20) {
        ForEach(0..<3, id: \.self) {index in
          HTPackageItem()
        }
      }
      Text("* $0.99 for the 1st week, then $4.99/month, ")
        .font(.system(size: 12))
        .foregroundColor(Color(hex: "#FF6C3C")) +
      Text("* you can cancel anytime")
        .font(.system(size: 12))
        .foregroundColor(Color(hex: "#999999"))
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct HTPremiumPackageSection_Previews: PreviewProvider {
  static var previews: some View {
    HTPremiumPackageSection()
  }
}
