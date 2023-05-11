//
//  HTPremiumAccessSection.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/8.
//

import SwiftUI

struct HTPremiumAccessSection: View {

  var var_accesses: [String] = ["remove all ads", "unlock all animes", "auto-renewing, cancel anytime"]

  var body: some View {
    VStack(alignment: .leading, spacing: 8){
      Text("Premium Access")
        .font(.system(size: 16))
        .fontWeight(.bold)
      VStack{
        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], alignment: .leading, spacing: 20) {
          ForEach(0..<var_accesses.count, id: \.self) {index in
            HStack(spacing: 10){
              VStack{}.frame(width: 6, height: 6)
                .background(Color(hex: "#2DAB41"))
                .clipShape(Capsule())
              Text(self.var_accesses[index])
            }
          }
        }
      }
      .padding(.horizontal, 18)
      .padding(.vertical, 16)
      .background(Color.white)
      .cornerRadius(8)
    }
    .frame(maxWidth: .infinity)
  }
}

struct HTPremiumAccessSection_Previews: PreviewProvider {
  static var previews: some View {
    HTPremiumAccessSection()
  }
}
