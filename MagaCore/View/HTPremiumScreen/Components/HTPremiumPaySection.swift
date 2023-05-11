//
//  HTPremiumPaySection.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/8.
//

import SwiftUI

struct HTPremiumPaySection: View {
    var body: some View {
      VStack(spacing: 0){
        Button {

        } label: {
          Text("Pay $4.99")
            .font(.system(size: 20))
        }
        .frame(maxWidth: .infinity, minHeight: 44)
        .foregroundColor(Color(hex: "#685034"))
        .background((LinearGradient(colors: [Color(hex: "#EDC391"), Color(hex: "#FDDDB7")], startPoint: .leading, endPoint: .trailing)))
        .clipShape(Capsule())

        Spacer().frame(height: 10)
        Text("If the ad still appears after purchase, tap ")
          .font(.system(size: 14))
          .foregroundColor(Color(hex: "#999999")) +
        Text("Restore.")
          .underline()
          .font(.system(size: 14))
          .foregroundColor(Color(hex: "#999999"))

        Spacer().frame(height: 10)
        Text("Subscription Terms")
          .underline()
          .font(.system(size: 14))
          .foregroundColor(Color(hex: "#999999"))
      }
      .padding(.horizontal, 15)
      .padding(.vertical, 10)
      .background(Color.white)
      .frame(maxWidth: .infinity)
    }
}

struct HTPremiumPaySection_Previews: PreviewProvider {
    static var previews: some View {
        HTPremiumPaySection()
    }
}
