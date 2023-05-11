//
//  HTPremiumScreen.swift
//  MagaCore
//
//  Created by MrMessy on 2023/4/29.
//

import SwiftUI

struct HTPremiumScreen: View {
  var body: some View {
    VStack{
      HTNavigationBar{
        VStack(alignment: .leading, spacing: 0){
          ScrollView(showsIndicators: false){
            VStack(spacing: 0){
              Spacer().frame(height: 15)
              HTPremiumPlanSection()
              Spacer().frame(height: 15)
              HTPremiumFollowSection()
              Spacer().frame(height: 25)
              HTPremiumAccessSection()
              Spacer().frame(height: 15)
              HTPremiumPackageSection()
            }
            .padding(.horizontal, 15)
          }
          .frame(maxWidth: .infinity)

          Spacer()

          HTPremiumPaySection()
        }
        .background(Color(hex: "#f5f5f5"))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      }
      .ht_title(title: "Premium")
    }
    .ignoresSafeArea()
  }
}

struct HTPremiumScreen_Previews: PreviewProvider {
  static var previews: some View {
    HTPremiumScreen()
  }
}
