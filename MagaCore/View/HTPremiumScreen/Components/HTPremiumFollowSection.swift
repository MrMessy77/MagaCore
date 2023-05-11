//
//  HTPremiumFollowSection.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/8.
//

import SwiftUI

struct HTPremiumFollowSection: View {
    var body: some View {
      HStack{
        VStack(alignment: .leading){
          Text("Follow This Link")
            .font(.system(size: 14))
            .fontWeight(.bold)
          Spacer().frame(height: 3)
          Text("Cancels on:july 3,2022")
            .font(.system(size: 12))
        }
        Spacer()
        HStack(spacing: 20){
          Button {

          } label: {
            Image("subscribe_phone")
          }
          Button {

          } label: {
            Image("subscribe_telegram")
          }
        }
      }
      .padding(12)
      .frame(maxWidth: .infinity)
      .background(Color.white)
      .cornerRadius(6)
    }
}

struct HTPremiumFollowSection_Previews: PreviewProvider {
    static var previews: some View {
        HTPremiumFollowSection()
    }
}
